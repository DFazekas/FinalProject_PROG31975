//
//  MeViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas, Mark Philips, Mark Beauchamp, Justine Manikan on 2018-11-14.
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
        //
    }
    
    // Declare & initialize user location and region radius
    let userLocation = CLLocation(latitude: 43.469147, longitude: -79.698683)
    let regionRadius : CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    /// TABLEVIEW SETUP STUBS ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // temp return condition
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
            renderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
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
        let coordRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        
        // Declare & Initialize a bounded circle around the user's location for better visualization
        let boundedCircle = MKCircle(center: userLocation.coordinate, radius: 1000)
        
        userMapView.setRegion(coordRegion, animated: true)
        userMapView.add(boundedCircle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToMe(segue : UIStoryboardSegue) {
        // Leave empty.
    }
}
