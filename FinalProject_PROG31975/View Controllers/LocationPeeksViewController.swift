//
//  LocationPeeksViewController.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 12/12/18.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class LocationPeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var peek : Peek? = nil
    var preplies : [PeekReply] = []
    
    @IBOutlet var message : UILabel!
    
    
    // TableView content.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Peeks to display.
        return self.preplies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of cells in TableView.
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Displays cells.
        
        // Obtain or create new cell.
        let tableCell : LocationPeekTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationPeekCell") as? LocationPeekTableViewCell ?? LocationPeekTableViewCell(style: .default, reuseIdentifier: "LocationPeekCell")
        
        // Obtain Peek to display.
        let row : PeekReply = preplies[indexPath.row]
        
        tableCell.lblMessage.text = row.getMessage()
        tableCell.lblRating.text = "101"
        tableCell.lblTimestamp.text = "1h"
        
        //TODO: Finish displaying Post data.
        
        return tableCell
    }
    
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        self.peek = mainDelegate.selectedPeek
        self.message.text = mainDelegate.selectedPeek?.getMessage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
