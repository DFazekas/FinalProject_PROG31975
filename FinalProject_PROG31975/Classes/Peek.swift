//
//  Peek.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class Peek: PeekInterface {
    
    private var peekLocation : String?
    private var numberOfReplies : Int?
    private var allReplies = Array<PeekReply>()
    
    override func initWithData(message: String, peekID:String, peekedTime:String) {
        
        // Constructor - calls parent constructor.
        
        super.initWithData(message: message, peekID: peekID, peekedTime: peekedTime)
    }
    
    func addReply(preply:  PeekReply){
        self.allReplies.append(preply)
    }
    func getLocation() -> String {
        // Return the posted location.
        
        return "Fake location"
    }
    
}
