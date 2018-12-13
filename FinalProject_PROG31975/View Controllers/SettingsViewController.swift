//
//  SettingsViewController.swift
//  FinalProject_PROG31975
//
//  Created by Mark Philips on 2018-11-14.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    // Declare & initialize all required @IBOutlet variables
    @IBOutlet var swEnableNotifications : UISwitch!
    @IBOutlet var swEnableEmails : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enableEmailNotificationsToggled(sender : UISwitch) {
        if (sender.isOn) {
            let alertController = UIAlertController(title: "Email Notifications", message: "Email Notifications have been enabled!", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            
            alertController.addAction(confirmAction)
            
            present(alertController, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToSettings(segue : UIStoryboardSegue) {
        // Leave empty.
    }

}
