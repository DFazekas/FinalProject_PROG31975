//
//  LocationPeekTableViewCell.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class LocationPeekTableViewCell: UITableViewCell {

    @IBOutlet var lblMessage : UILabel!     // Displays the message of the post.
    @IBOutlet var imgAvatar : UIImageView!  // Displays the user's unique avatar.
    @IBOutlet var lblTimestamp : UILabel!   // Displays the time since posted.
    @IBOutlet var lblRating : UILabel!      // Displays the rating of the post.
    @IBOutlet var btnUpvote : UIButton!     // Button for upvoting the post.
    @IBOutlet var btnDownvote : UIButton!   // Button for downvoting the post.
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    


}
