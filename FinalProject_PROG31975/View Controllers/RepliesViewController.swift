//
//  RepliesViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas, Mark Philips, Mark Beauchamp, Justine Manikan on 2018-11-14.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class RepliesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var post : Post? = nil
    var replies : [Reply] = []
    
    @IBOutlet var message : UILabel!

    
    ///// TableView content.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many Posts to display.
        return self.replies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of cells in TableView.
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Displays cells.
        
        // Obtain or create new cell.
        let tableCell : ReplyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell") as? ReplyTableViewCell ?? ReplyTableViewCell(style: .default, reuseIdentifier: "ReplyCell")
        
        // Obtain Post to display.
        let rowObj : Reply = replies[indexPath.row]
        
        tableCell.lblMessage.text = rowObj.getMessage()
        tableCell.lblRating.text = "101"
        tableCell.lblTimestamp.text = "1h"
        
        //TODO: Finish displaying Post data.
        
        return tableCell
    }
    
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        self.post = mainDelegate.selectedPost
        self.message.text = mainDelegate.selectedPost?.getMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
