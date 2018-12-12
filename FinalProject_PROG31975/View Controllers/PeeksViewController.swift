//
//  PeeksViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-14.
//  Copyright © 2018 PROG31975. All rights reserved.
//
//Justine Manikan
//December 3rd, 2018

import UIKit

class PeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var tblView : UITableView!
    @IBOutlet var locTextField : UITextField!
    
    @IBAction func findLocation(sender : UIBarButtonItem){
        
        let alertController = UIAlertController(title: "Find Location", message: "Sort Peeks", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { (locTextField) in
            locTextField.placeholder = "Enter a Location"
            self.locTextField = locTextField
            })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        })
        
        let saveAction = UIAlertAction(title: "Save Location", style: .default, handler: { (action) in
            
            if self.locTextField.text != "" {
                
            } else{
                //Show message after trying to save without text
                
            }
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mainDelegate.peeks.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "peek") as? PeekCell ??
            PeekCell(style: .default, reuseIdentifier: "peek")
        
        let rowNum = indexPath.row
        //tableCell.lblMessage.text = mainDelegate.pee
        
        
        //placeholder
        return tableCell
    }
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToPeeks(segue : UIStoryboardSegue) {
        // Leave empty.
    }
    
    
}
