//
//  User.swift
//  FinalProject_PROG31975
//
//  Created by Mark Philips on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class User : NSObject {
    // Declare all required variables for the User Class
    var id : Int?
    var name : String?
    var email : String?
    var currentLocation : String?
    var savedPeeks = Array<String?>()
    var allVotes : Int?
    var allPosts = Array<Post?>()
    var allReplies = Array<Reply?>()
    var notificationSound : Bool?
    var emailNotification : Bool?
    
    func initWithData(name : String, email : String, currentLocation : String) {
        self.id = -1 //TODO: Assign unique ID.
        self.name = name
        self.email = email
        self.currentLocation = currentLocation
        self.savedPeeks = Array<String>()
        self.allVotes = 0
        self.allPosts = Array<Post>()
        self.allReplies = Array<Reply>()
        self.notificationSound = true
        self.emailNotification = false
    }
    
}
