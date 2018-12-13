//
//  HomeInterfaceController.swift
//  FinalProjectWatch_PROG31975 Extension
//
//  Created by Devon on 2018-12-13.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class HomeInterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var postTable : WKInterfaceTable!
    var posts : [Post] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        print("HomeInterface - awake")
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    override func willActivate() {
        super.willActivate()
        print("HomeInterface - WillActivate")
        if (WCSession.default.isReachable) {
            let message = ["getPostData" : [:]]
            
            WCSession.default.sendMessage(message, replyHandler: {(result) -> Void in
                if result["postData"] != nil {
                    print("HomeInterface - postData received")
                    let loadedData = result["postData"]
                    NSKeyedUnarchiver.setClass(Post.self, forClassName: "Post")
                    let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [Post]
                    self.posts = loadedPerson!
                    self.postTable.setNumberOfRows(self.posts.count, withRowType: "PostRowController")
                    
                    // Assign values to tableView cell.
                    for (index, post) in self.posts.enumerated() {
                        let row = self.postTable.rowController(at: index) as! PostRowController
                        row.btnMessage.setTitle(post.getMessage())
                        row.lblRating.setText(post.getAllVotes().description)
                    }
                }
            }, errorHandler: {
                (error) -> Void in print(error)
            })
        }
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    private func session(_ session: WCSession, didReceiveMessageData messageData: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("HomeInterace - DidReceiveMessageData")
        var replyValues = Dictionary<String, AnyObject>()
        let loadedData = messageData["postData"]
        let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [Post]
        posts = loadedPerson!
        replyValues["status"] = "Post Received" as AnyObject?
        replyHandler(replyValues)
    }

}
