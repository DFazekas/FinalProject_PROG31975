//
//  ViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-10-29.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Navigation Bar.
        setupNavigationBarItems()
    }

    private func setupNavigationBarItems() {
        let titleViewImage = UIImageView(image: #imageLiteral(resourceName: "icon_add"))
        navigationItem.titleView = titleViewImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

