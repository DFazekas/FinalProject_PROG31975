//
//  LocationPeeksViewController.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class LocationPeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts : [Post] = [] // List of Posts to display.
    var timer : Timer!
    var lastMessage : CFAbsoluteTime = 0 // Watch message.
    let getData = GetData()
    @IBOutlet var peekTable : UITableView!
    
    
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
                self.peekTable.reloadData()
                self.timer.invalidate()
            }
            
            
        }
    }
    
    // TableView content.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Peeks to display.
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of cells in TableView.
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Displays cells.
        
        // Obtain or create new cell.
        let tableCell : PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationPeekCell") as? PostTableViewCell ?? PostTableViewCell(style: .default, reuseIdentifier: "LocationPeekCell")
        
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
    
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
