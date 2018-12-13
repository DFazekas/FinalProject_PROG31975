//
//  PostInterface.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas, Mark Philips, Mark Beauchamp, Justine Manikan on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostInterface : NSObject {
    // Post contains data of the ananomous, public post.
    
    public var postID : Int? // The identifier of the post.
    private var authorID : String? // Identifier of the original poster.
    private var message : String? // The displayed message.
    public var allVotes : Int? // Sum of votes displayed.
    private var myVote : Int? // Displayed user vote.
    private var postedTime : String? // Displayed timestamp (e.g., 26m, 3h, 4d, 2y).
    
    func initWithData(authorID:String, message:String, postedTime:String) {
        // Constructor.
        
        self.postID = 0
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

    func getPostID() -> Int {
        return self.postID!
    }
    func getAuthorID() -> String {
        return self.authorID!
    }
    func getMessage() -> String {
        return self.message!
    }
    func getAllVotes() -> Int {
        return self.allVotes!
    }
    func getMyVote() -> Int {
        return self.myVote!
    }
    func getPostedTime() -> String {
        return self.postedTime!
    }
}

