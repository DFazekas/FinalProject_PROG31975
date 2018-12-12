//
//  ViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-10-29.
//  Programmed by Mark
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts : [Post] = [] // List of Posts to display.
    
    //
    
    
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

        tableCell.lblMessage.text = rowObj.getMessage()
        tableCell.lblRating.text = "101"
        tableCell.lblReplies.text = "2 Replies"
        tableCell.lblTimestamp.text = "1h"
        
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
    func initFakeData() {
        let postObj = Post()
        postObj.initWithData(authorID: 1023123, message: "Just realized that beef jerky is kinda like a cow raisin", postedTime: "11-08-2018 17:56")
        posts.append(postObj)
        
        let postObj2 = Post()
        postObj2.initWithData(authorID: 1223423, message: "That awkward moment when you're in the bathroom stall and you make eye contact with the person checking to see if the stall is empty", postedTime: "11-08-2018 17:56")
        posts.append(postObj2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load fake default data.
        initFakeData()
        
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

