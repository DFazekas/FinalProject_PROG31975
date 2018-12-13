//
//  PostViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-07.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet var textView : UITextView!
    var getData = GetData()
       var timer : Timer!
    
    @IBAction func submitPost(){
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        getData.sendPost(message: textView.text, location: "43.469147,-79.698683")
        
    }
    
    @objc func refreshTable(){
        if(getData.dbData != nil)
        {
          
                self.timer.invalidate()
            
        }
    }
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
