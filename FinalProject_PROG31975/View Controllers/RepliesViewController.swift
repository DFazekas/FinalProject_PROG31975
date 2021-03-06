//
//  RepliesViewController.swift
//  FinalProject_PROG31975
//
//  Created by Mark Beauchamp on 2018-11-14.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class RepliesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    var post : Post? = nil
    var replies : [Reply] = []
    var timer : Timer!
    var timer2 : Timer!

    let getData = GetData()
    let replyData = GetData()
    @IBOutlet var myTable : UITableView!
    @IBOutlet var lblLikes : UILabel!
    @IBOutlet var message : UILabel!
    @IBOutlet var reply : UITextView!
    @IBOutlet var lblReply : UILabel!
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Remove placeholder.
        textView.text = ""
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    @IBAction func sendReply(){
        
        self.timer2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable2), userInfo: nil, repeats: true);
        replyData.sendReply(message: reply.text, postId:String(self.post!.postID!))
    }
    
    @objc func refreshTable2(){
        if(replyData.dbData != nil)
        {
           
            self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
            
            getData.getReplies(id:(self.post?.postID)!)
                self.myTable.reloadData()
                self.timer2.invalidate()
            }
    
    }
    
    
    // swift 4 update
    @objc func refreshTable(){
        if(getData.dbData != nil)
        {
            if (getData.dbData?.count)! > 0
            {
                replies = []
                for i in getData.dbData!{
                    
                    
                    let p = Reply()
                    
                    p.initWithData(authorID: i["user"] as! String, message: i["message"] as! String, dateString: i["time_posted"] as! String)
                    p.postID = i["id"] as? Int
                    let likes = (i["likes"] as? Int)
                    p.allVotes = likes ?? 0
                    
                    replies.append(p)
                    
                }
                self.myTable.reloadData()
                self.timer.invalidate()
            }
        }
    }
    
    ///// TableView content.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Posts to display.
        return self.replies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of cells in TableView.
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Displays cells.
        
        // Obtain or create new cell.
        let tableCell : ReplyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell") as? ReplyTableViewCell ?? ReplyTableViewCell(style: .default, reuseIdentifier: "ReplyCell")
        
        // Obtain Post to display.
        let rowObj : Reply = replies[indexPath.row]
        
        tableCell.lblMessage.text = rowObj.getMessage()
        tableCell.lblRating.text = "101"
        tableCell.lblTimestamp.text = "1h"
        
        //TODO: Finish displaying Post data.
        
        return tableCell
    }
    
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        self.post = mainDelegate.selectedPost
        self.message.text = mainDelegate.selectedPost?.getMessage()
        self.lblLikes.text = String(self.post!.allVotes!);
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        self.lblReply.text = String(self.post!.numberOfReplies!) + " Replies"
        
        getData.getReplies(id:(self.post?.postID)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
