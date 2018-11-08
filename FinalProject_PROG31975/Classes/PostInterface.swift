//
//  PostInterface.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostInterface : NSObject {
    // Post contains data of the ananomous, public post.
    
    private var postID : Int? // The identifier of the post.
    private var authorID : Int? // Identifier of the original poster.
    private var message : String? // The displayed message.
    private var allVotes : Int? // Sum of votes displayed.
    private var myVote : Int? // Displayed user vote.
    private var postedTime : String? // Displayed timestamp (e.g., 26m, 3h, 4d, 2y).
    
    func initWithData(authorID:Int, message:String, postedTime:String) {
        // Constructor.
        
        self.postID = 0 //TODO: assign unique ID.
        self.authorID = authorID
        self.message = message
        self.postedTime = postedTime
    }
    
    func addVote(myVote: Int) {
        // Update sum of votes for Post.
        
        self.myVote = myVote
        //TODO: Update indicator UI.
        self.allVotes? += myVote
    }
}

