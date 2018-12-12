//
//  PeekReply.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit


class PeekReply : PeekInterface {
    // Reply is a subclass to Post, containing data of reply to a particular post.
    
    private var avatarColor : String? // Displayed color representating the User.
    
    override func initWithData(message: String, peekID:String, peekedTime:String) {
        // Constructor - calls parent constructor.
        
        super.initWithData(message: message, peekID: peekID, peekedTime: peekedTime)
        
    }
    
    func findColor() -> String {
        // Replies are color-coordinated to identify anonymous users.
        
        //TODO: Record author's previous Replies, use same color as before.
        return "fake color"
    }
}
