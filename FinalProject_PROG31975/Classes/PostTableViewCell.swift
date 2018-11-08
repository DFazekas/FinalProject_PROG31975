//
//  PostTableViewCell.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas on 11/8/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var lblMessage : UILabel! // Displays the message of the post.
    @IBOutlet var lblTimestamp : UILabel! // Displays the time since posted.
    @IBOutlet var lblReplies : UILabel! // Dislays number of replies, if any.
    @IBOutlet var lblRating : UILabel! // Displays the rating of the post.
    @IBOutlet var btnUpvote : UIButton! // Button for upvoting the post.
    @IBOutlet var btnDownvote : UIButton! // Button for downvoting the post.
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func vote(sender : UIButton) {
        // Handles voting. Post scores are public and affect the OP.
        //TODO: Implement voting functionality.
        
        // Vote is +1 for Up votes, else -1 doe Down votes.
        let vote = (sender.accessibilityLabel == "up_vote") ? 1 : -1
        
        // Get current rate from label (not ideal).
        let currentRate : Int = Int(lblRating.text!)!
        
        // Update label.
        lblRating.text = String(currentRate + vote)
    }
    
}
