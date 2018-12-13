//
//  Posts.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class Post : PostInterface {
    
    private var postedLocation : String? // Posted location used for radius calculation.
    public var numberOfReplies : Int? // Displayed sum of replies for this post.
    private var allReplies = Array<Reply>() // Historic list of all replies associated with this post.

    override func initWithData(authorID:String, message:String, dateString:String) {
        // Constructor - calls parent constructor.
        super.initWithData(authorID: authorID, message: message, dateString: dateString)
    }

    
    func addReply(reply:Reply) {
        // Appends a new Reply to the Post's list of Replies.
        
        self.allReplies.append(reply) 
    }

    func getLocation() -> String {
        // Return the posted location.
        
        return "Fake location"
    }
}
