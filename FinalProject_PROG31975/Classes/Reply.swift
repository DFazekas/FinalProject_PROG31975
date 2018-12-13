//
//  Reply.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class Reply : PostInterface {
    // Reply is a subclass to Post, containing data of reply to a particular post.
    
    private var avatarColor : String? // Displayed color representating the User.
    
    override func initWithData(authorID:String, message:String, postedTime:String) {
        // Constructor - calls parent constructor.
        
        super.initWithData(authorID: authorID, message: message, postedTime: postedTime)
        avatarColor = findColor() // Set appropriate color to reply.
    }
    
    func findColor() -> String {
        // Replies are color-coordinated to identify anonymous users.
        
        //TODO: Record author's previous Replies, use same color as before.
        return "fake color"
    }
}
