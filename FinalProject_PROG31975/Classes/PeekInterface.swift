//
//  PeekInterface.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas, Mark Philips, Mark Beauchamp, Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PeekInterface: NSObject {

    // Peek interface
    // The displayed message.
    private var message : String?
    private var peekID : Int?
    private var peekedTime : String?
    private var location : String?
   
    
    func initWithData( message:String, peekID: String, peekedTime:String, location:String) {
    // Constructor.
        
        self.message = message
        self.peekID = 0
        self.peekedTime = peekedTime
        self.location = location
    }
    
    //Click on table cell
    func getLocation() -> String {
    //
        return self.location!
    }
    
    func getMessage() -> String {
        return self.message!
    }
    
    func getPeekID() -> Int {
        return self.peekID!
    }
    
    func getPeekedTime() -> String{
        return self.peekedTime!
    }
    
}
