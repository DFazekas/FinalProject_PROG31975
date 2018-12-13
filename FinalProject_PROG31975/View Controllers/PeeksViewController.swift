//
//  PeeksViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon Fazekas, Mark Philips, Mark Beauchamp, Justine Manikan on 2018-12-3.
//  Copyright © 2018 PROG31975. All rights reserved.
//

//Justine Manikankan
//December 3rd, 2018

import UIKit

class PeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var peeks: [Peek] = []
    let getData = GetData()
    var timer : Timer!
    @IBOutlet var peekTable : UITableView!
    
    @IBOutlet var locTextField : UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        
        getData.getPeeks()
        
    }
    
    @objc func refreshTable(){
        if(getData.dbData != nil)
        {
            if (getData.dbData?.count)! > 0
            {
                peeks = []
                for i in getData.dbData!{
                    
                    
                    let p = Peek()
                    
                    p.initWithData( message: i["message"] as! String, peekID: i["user"] as! String, peekedTime: i["time_posted"] as! String, location: i["location" ] as! String)
                    peeks.append(p)
                    
                }
                self.peekTable.reloadData()
                self.timer.invalidate()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Onclick handling.
        
        // Record selected Post to display in Replies page.
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.selectedPeek = peeks[indexPath.row]
        
        // Segue to Replies page.
        performSegue(withIdentifier: "PeekAreaSegue", sender: nil)
    }
    
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
                
                //let location = self.locTextField.text
                self.refreshTable()
                
            } else{
                //
                
            }
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mainDelegate.peeks.count
        if getData.dbData != nil
        {
            return (getData.dbData?.count)!
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell : PeekCell = tableView.dequeueReusableCell(withIdentifier: "peekCell") as?
        PeekCell ?? PeekCell(style: .default, reuseIdentifier: "peekCell")
        
        let row : Peek = peeks[indexPath.row]
        
        tableCell.lblLocation.text = "Location: " + row.getLocation() as? String
        
        //placeholder
        return tableCell
    }
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData.jsonParser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToPeeks(segue : UIStoryboardSegue) {
        // Leave empty.
    }
    
    
}
