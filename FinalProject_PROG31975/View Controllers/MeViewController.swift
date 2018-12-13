//
//  MeViewController.swift
//  FinalProject_PROG31975
//
//  Created by Mark Philips on 2018-11-14.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MeViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    // Declare Required IBOutlet variables
    @IBOutlet var userMapView : MKMapView!
    @IBOutlet var swContentToggle : UISegmentedControl!
    @IBOutlet var contentTable : UITableView!
    
    @IBAction func contentToggleTriggered(sender : UISegmentedControl) {
        // Check the UISegmentedControl's currently enabled state
        if (sender.selectedSegmentIndex == 0) { // My Posts
            // Get the post data from the Database
            var posts : [Post] = getPostData()
            
            // Refresh the table to display the post content
            contentTable.reloadData()
        } else { // My Replies
            // Get the reply data from the database
            var replies : [Reply] = getReplyData()
            
            // Refresh the table to display the reply content
            contentTable.reloadData()
        }
    }
    
    // Declare & initialize user location and region radius
    let userLocation = CLLocation(latitude: 43.469147, longitude: -79.698683)
    let regionRadius : CLLocationDistance = 100
    let radius = 2500.0
    var circleAlpha = 0.04 // Alpha of the circle overlay.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the user's map view
        userMapViewSetup()
        
        // Load the post data for the ContentTable
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Timer object for the ContentTable
        //var timer : Timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.getPostData), userInfo: nil, repeats: true)
        
        
    }
    
    
    /// TABLEVIEW SETUP STUBS ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // temp return condition
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let tableCell = tableView.dequeueReusableCell(withIdentifier: "<#T##String#>")
        
        // Temp return, will fix on next commit
        return UITableViewCell()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Create the Bounded Circle
        if overlay is MKCircle {
            // Declare & initialize the Circle Renderer
            let renderer = MKCircleRenderer(overlay: overlay)
            
            // Set the Bounded Circle Visual Properties
            renderer.fillColor = UIColor.blue.withAlphaComponent(CGFloat(circleAlpha))
            renderer.lineWidth = 2
            
            // Retrun the circle Renderer
            return renderer
        }
        
        // Return the Overlay Renderer
        return MKOverlayRenderer()
    }
    
    /// MAIN METHODS ///
    func centerMapOnLocation(location : CLLocation) {
        // Declare & initialize the coordinate region
        let coordRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radius, radius)
        
        // Declare & Initialize a bounded circle around the user's location for better visualization
        let boundedCircle = MKCircle(center: userLocation.coordinate, radius: radius/2)
        
        userMapView.setRegion(coordRegion, animated: true)
        userMapView.add(boundedCircle)
        
        circleAlpha = circleAlpha * 2
        let innerCircle = MKCircle(center: userLocation.coordinate, radius: radius/3)
        userMapView.add(innerCircle)
        
        circleAlpha = circleAlpha * 3
        let innerCircle2 = MKCircle(center: userLocation.coordinate, radius: radius/5)
        userMapView.add(innerCircle2)
    }

    /*
     * Helper function that aggregates all the post data from the database
     * and returns a list of posts
     */
    func getPostData() -> [Post] {
        var postData = GetData()
        var posts : [Post] = []
        
        // Check to see if the Database exists
        if (postData.dbData != nil) {
            // Check to see if the database has data
            if (postData.dbData?.count)! > 0 {
                // Reinitialize the Posts Array to ensure it's the most current data
                posts = []
                
                // Iterate through the database and aggregate the recorded posts
                for currPost in postData.dbData! {
                    // Declare & initialize a new Post object
                    let post = Post()
                    
                    // Initialize the Post object with the data from the database
                    post.initWithData(authorID: currPost["user"] as! String, message: currPost["message"] as! String, dateString: currPost["time_posted"] as! String)
                    
                    // Set the post ID
                    post.postID = currPost["id"] as? Int
                    
                    // Append to post to the list of posts
                    posts.append(post)
                }
            } else {
                // Create an alert to notify the user that no new posts are currently available
                let alertController = UIAlertController(title: "View Posts", message: "No New Posts! Try again later!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                
                // Bind the confirmation action to the alert
                alertController.addAction(confirmAction)
                
                // Present the alert to the user
                present(alertController, animated: true)
            }
        }
        
        // Return the list of posts
        return posts
    }
    
    /*
     * Helper function that aggregates all the reply data form the database and returns a list of replies
     */
    func getReplyData() -> [Reply] {
        var replyData = GetData()
        var replies : [Reply] = []
        
        // Check to see if the Database exists
        if (replyData.dbData != nil) {
            // Check to see if the database has data
            if (replyData.dbData?.count)! > 0 {
                // Re-initialize the Replies array to ensure it's the most current data
                replies = []
                
                // Iterate through the database and aggregate the recorded replies
                for currReply in replyData.dbData! {
                    // Declare & initialize a new Reply object
                    let reply = Reply()
                    
                    // Initialize the Reply object with the data from the database
                    reply.initWithData(authorID: currReply["user"] as! String, message: currReply["message"] as! String, dateString: currReply["time_posted"] as! String)
                    
                    // Set the Reply ID
                    reply.postID = currReply["id"] as? Int
                    
                    // Append the reply to the lsit of replies
                    replies.append(reply)
                }
            } else {
                // Create an alert to notify the user that no new posts are currently available
                let alertController = UIAlertController(title: "View Replies", message: "No New Replies! Try again later!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                
                // Bind the confirmation action to the alert
                alertController.addAction(confirmAction)
                
                // Present the alert to the user
                present(alertController, animated: true)
            }
        }
        
        return replies
    }
    
    /*
     * Helper function that sets up the user's map view
     */
    func userMapViewSetup() {
        // Center the MapView relative to the user
        centerMapOnLocation(location: userLocation)
        
        // Create a DropPin for the user
        let userDropPin = MKPointAnnotation()
        
        // Set the user's DropPin properties
        userDropPin.coordinate = userLocation.coordinate
        userDropPin.title = "Your current location"
        
        // Add the user's DropPin to the MapView
        userMapView.addAnnotation(userDropPin)
        userMapView.selectAnnotation(userDropPin, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToMe(segue : UIStoryboardSegue) {
        // Leave empty.
    }
}
