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
    
    public var postID : Int? // The identifier of the post.
    private var authorID : String? // Identifier of the original poster.
    private var message : String? // The displayed message.
    public var allVotes : Int? // Sum of votes displayed.
    private var myVote : Int? // Displayed user vote.
    private var postedTime : String? // Displayed timestamp (e.g., 26m, 3h, 4d, 2y).
    private var dateTime : Date? // Posted date (e.g., 2018-12-13 03:55:49 +0000).
    
    func initWithData(authorID:String, message:String, dateString:String) {
        // Constructor.
        
        self.postID = 0
        self.authorID = authorID
        self.message = message
        self.dateTime = self.stringToDate(dateString: dateString)
        self.postedTime = self.parseDateTime(dateTime: dateTime!)
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
    func getDateTime() -> Date {
        return self.dateTime!
    }
    func getPostedTime() -> String {
        return self.postedTime!
    }
    private func parseDateTime(dateTime:Date) -> String {
        // Returns a timestamp in one of the following formats (2d, 6h, 24m, 50s).
        var timeStamp : String = ""
        
        // Compute difference between Then and Now dates.
        let seconds = Date().timeIntervalSince(dateTime)
        
        if seconds - 86400 > 0 { // Seconds in day.
            timeStamp = "\(Int(seconds / 86400))d"
        } else if seconds - 3600 > 0 { // Seconds in hour.
            timeStamp = "\(Int(seconds / 3600))h"
        } else if seconds - 60 > 0 { // Seconds in minute.
            timeStamp = "\(Int(seconds / 60))m"
        } else {
            timeStamp = "\(Int(seconds))s"
        }
        return timeStamp
    }
    private func stringToDate(dateString:String) -> Date {
        // Convert MySQL Date to Swift Date.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let thenDate = dateFormatter.date(from: dateString)
        return thenDate!
    }
}

