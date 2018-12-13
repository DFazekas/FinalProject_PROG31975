//
//  PostViewController.swift
//  FinalProject_PROG31975
//
//  Created by Devon on 2018-11-07.
//  Copyright © 2018 PROG31975. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {

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
    
    ///// TextView content.
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Remove placeholder.
        textView.text = ""
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    ///// Misc. content.
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "What's on your mind?"
        textView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
