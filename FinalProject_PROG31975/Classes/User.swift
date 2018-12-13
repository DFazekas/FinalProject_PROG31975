//
//  User.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-02.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class User : NSObject {
    // User contains sensitive information that identifies the individual, as well as their preferences and history.
    
    var id : Int? // Identifier for the User.
    var name : String? // Displayed name of the User.
    var email : String? // Email for authentication.
    var currentLocation : String? // Current location used for radius calculation.
    var savedPeeks = Array<String?>() // List of saved locations to receieve posts from.
    var allVotes : Int? // Displayed sum of all votes across all posts.
    var allPosts = Array<Post?>() // Historic list of all posts.
    var allReplies = Array<Reply?>() // Historic list of all replies of posts.
    var notificationSound : Bool? // Controls whether notification sound (i.e., ON or OFF).
    var emailNotification : Bool? // Controls whether to send email notifications as well (i.e., ON or OFF).
    
    func initWithData(name:String, email:String, currentLocation:String) {
        // Constructor.
        
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
