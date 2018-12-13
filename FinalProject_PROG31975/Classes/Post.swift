//
//  Posts.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class Post : PostInterface, NSCoding {
    
    private var postedLocation : String? // Posted location used for radius calculation.
    public var numberOfReplies : Int? // Displayed sum of replies for this post.
    private var allReplies = Array<Reply>() // Historic list of all replies associated with this post.

    override func initWithData(authorID:String, message:String, dateString:String) {
        // Constructor - calls parent constructor.
        super.initWithData(authorID: authorID, message: message, dateString: dateString)
    }
    override func initWithData(authorID:String, message:String, dateTime:Date) {
        // Constructor - calls parent constructor.
        super.initWithData(authorID: authorID, message: message, dateTime: dateTime)
    }
    
    func addReply(reply:Reply) {
        // Appends a new Reply to the Post's list of Replies.
        self.allReplies.append(reply) 
    }

    func getLocation() -> String {
        // Return the posted location.
        return "Fake location"
    }
    
    required convenience init?(coder decoder: NSCoder) {
        // Deserializes data - decodes for watch.
        print("Post - decoder")
        guard
//            let postID = decoder.decodeObject(forKey: "postID") as? Int,
            let authorID = decoder.decodeObject(forKey: "authorID") as? String,
            let message = decoder.decodeObject(forKey: "message") as? String,
//            let allVotes = decoder.decodeObject(forKey: "allVotes") as? Int,
//            let myVote = decoder.decodeObject(forKey: "myVote") as? Int,
//            let postedTime = decoder.decodeObject(forKey: "postedTime") as? String,
            let dateTime = decoder.decodeObject(forKey: "dateTime") as? Date
            else {
                return nil
        }
        self.init()
        self.initWithData(authorID: authorID, message: message, dateTime: dateTime)
    }
    
    func encode(with coder: NSCoder) {
        // Serializes data - sends data to watch.
        print("Post - coder")
        //coder.encode(self.postID, forKey: "postID")
        coder.encode(self.authorID, forKey: "authorID")
        coder.encode(self.getMessage(), forKey: "message")
        //oder.encode(self.getAllVotes(), forKey: "allVotes")
        //coder.encode(self.getMyVote(), forKey: "myVote")
        //coder.encode(self.getPostedTime(), forKey: "postedTime")
        coder.encode(self.getDateTime(), forKey: "dateTime")
    }
}
