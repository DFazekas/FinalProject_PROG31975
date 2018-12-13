//
//  ViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-10-29.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts : [Post] = [] // List of Posts to display.
    var timer : Timer!
    let getData = GetData()
    @IBOutlet var myTable : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        
        getData.getPosts()
        
        
    }
    
    @objc func refreshTable(){
        if (getData.dbData != nil) {
            if (getData.dbData?.count)! > 0 {
                posts = []
                for i in getData.dbData!{
                    let p = Post()
                    
                    let then = i["time_posted"] as! String
                    
                    
                    p.initWithData(authorID: i["user"] as! String, message: i["message"] as! String, dateString: then)
                    p.postID = i["id"] as? Int
                    let likes = (i["likes"] as? Int)
                    p.allVotes = likes ?? 0
                    
                    posts.append(p)
                }
                self.myTable.reloadData()
                self.timer.invalidate()
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
        tableCell.lblReplies.text = "2 Replies"
        tableCell.lblTimestamp.text = rowObj.getPostedTime() as? String
        
        
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
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load fake default data.
        //initFakeData()
        
        // Setup Navigation Bar.
        //setupNavigationBarItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToHome(segue : UIStoryboardSegue) {
        // Leave empty.
    }
}

