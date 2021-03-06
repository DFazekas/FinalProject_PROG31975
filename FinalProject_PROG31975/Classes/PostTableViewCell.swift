//
//  PostTableViewCell.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas on 11/8/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var lblMessage : UILabel!     // Displays the message of the post.
    @IBOutlet var lblTimestamp : UILabel!   // Displays the time since posted.
    @IBOutlet var lblReplies : UILabel!     // Dislays number of replies, if any.
    @IBOutlet var lblRating : UILabel!      // Displays the rating of the post.
    @IBOutlet var btnUpvote : UIButton!     // Button for upvoting the post.
    @IBOutlet var btnDownvote : UIButton!   // Button for downvoting the post.
    public var post : Post!
    let getData = GetData()
    var timer : Timer!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc func refreshTable(){
        if(getData.dbData != nil)
        {
            
              
            lblRating.text = String(getData.dbData![0]["likes"] as! Int)
                    
            
            
                self.timer.invalidate()
            }
        }
    
    
    @IBAction func vote(sender : UIButton) {
        // Handles voting. Post scores are public and affect the OP.
        var vote = Int(lblRating.text!)!
        let voteType = (sender.accessibilityLabel == "down_vote") ? -1 : 1 // Upvote +1, Downvote -1
        if voteType == 1 && vote < 1 {
            vote = vote + 1
        } else if voteType == -1 && vote > -1 {
            vote = vote - 1
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        getData.like(positive: vote, post: post.postID!)
        // Get current rate from label (not ideal).
       //let currentRate : Int = Int(lblRating.text!)!
        
        // Update label.
       // lblRating.text = String(currentRate + vote)
    }
    
}
