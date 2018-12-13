//
//  ViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-10-29.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit
import WatchConnectivity

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WCSessionDelegate {

    var posts : [Post] = [] // List of Posts to display.
    var timer : Timer!
    var lastMessage : CFAbsoluteTime = 0 // Watch message.
    let getData = GetData()
    @IBOutlet var myTable : UITableView!
    
    func initFakeData() {
        let post = Post()
        post.initWithData(authorID: "2", message: "Hello, world", dateTime: Date())
        posts.append(post)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        
        getData.getPosts()
    }
    
    @objc func refreshTable(){
        if (getData.dbData != nil) {
            if (getData.dbData?.count)! > 0 {
                print("Only just now refreshing table")
                posts = []
                for i in getData.dbData!{
                    let p = Post()
                    
                    let then = i["time_posted"] as! String
                    
                    p.initWithData(authorID: i["user"] as! String, message: i["message"] as! String, dateString: then)
                    p.postID = i["id"] as? Int
                    let likes = (i["likes"] as? Int)
                    p.allVotes = likes ?? 0
                    p.numberOfReplies = i["replies"] as? Int
                    
                    posts.append(p)
                }
                self.myTable.reloadData()
                self.timer.invalidate()
                
                // Watch.
                print("HomeViewController - Posts.count: \(self.posts.count)")
                if (WCSession.isSupported()) {
                    let session = WCSession.default
                    session.delegate = self
                    session.activate()
                } else {
                    print("HomeViewController - WatchConnectivity is not supported on this device")
                }
                
                // Calls encoder.
                let postData = NSKeyedArchiver.archivedData(withRootObject: posts)
                print("HomeViewController - executing sendWatchMessage")
                sendWatchMessage(postData)
            }
        }
    }
    
    ///// TableView content.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Posts to display.
       return posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of cells in TableView.
        return 134
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Displays cells.
        
        // Obtain or create new cell.
        let tableCell : PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostTableViewCell ?? PostTableViewCell(style: .default, reuseIdentifier: "PostCell")
        
        // Obtain Post to display.
        let rowObj : Post = posts[indexPath.row]
        
        let likes = 0
        
        tableCell.post = rowObj
        tableCell.lblMessage.text = rowObj.getMessage() as? String
        tableCell.lblRating.text = String(rowObj.allVotes!)
        tableCell.lblReplies.text = String(rowObj.numberOfReplies!) + " Replies"
        tableCell.lblTimestamp.text = rowObj.getPostedTime() as? String
        
        if rowObj.allVotes! < 0 {
            tableCell.lblRating.textColor = .red
        } else {
            tableCell.lblRating.textColor = .black
        }
        
        //TODO: Finish displaying Post data.
        
        return tableCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Onclick handling.
        
        // Record selected Post to display in Replies page.
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.selectedPost = posts[indexPath.row]
        
        // Segue to Replies page.
        performSegue(withIdentifier: "ViewRepliesSegue", sender: nil)
    }
    
    ///// Watch content.
    func sendWatchMessage(_ msgData:Data) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        if lastMessage + 0.5 > currentTime {
            return
        }
        
        if WCSession.default.isReachable {
            print("HomeViewController - sendWatchMessage")
            let message = ["postData" : msgData]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    func sessionDidBecomeInactive(_ session: WCSession) { }
    func sessionDidDeactivate(_ session: WCSession) { }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        // TODO: Investigate difference in function didReceieveMessageDATA
        print("HomeViewController - didReceiveMessage")
        var replyValues = Dictionary<String, AnyObject>()
        if message["getPostData"] != nil {
            NSKeyedArchiver.setClassName("Post", for: Post.self)
            let postData = NSKeyedArchiver.archivedData(withRootObject: posts)
            replyValues["postData"] = postData as AnyObject?
            replyHandler(replyValues)
        }
    }
//    private func session(_ session: WCSession, didReceiveMessageData messageData: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//        print("HomeInterace - DidReceiveMessageData")
//        var replyValues = Dictionary<String, AnyObject>()
//        let loadedData = messageData["postData"]
//        let loadedPerson = NSKeyedUnarchiver.unarchiveObject(with: loadedData as! Data) as? [Post]
//        posts = loadedPerson!
//        replyValues["status"] = "Post Received" as AnyObject?
//        replyHandler(replyValues)
//    }
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjust tableView cell separator style.
        myTable.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        myTable.separatorColor = UIColor.darkGray
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToHome(segue : UIStoryboardSegue) {
        // Leave empty.
    }
}

