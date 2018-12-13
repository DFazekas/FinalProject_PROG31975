//
//  PeekCell.swift
//  FinalProject_PROG31975
//
//  Created by Justine Manikan on 03/12/2018.
//  Copyright © 2018 PROG31975. All rights reserved.
//
//Justine Manikan
//December 3rd, 2018
import UIKit

class PeekCell: UITableViewCell {
    
    //Must be able to click cell
    @IBOutlet var lblMessage : UILabel!
    @IBOutlet var lblLocation : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //initialization code
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func viewPeek(sender: UILabel){
        
        
        
    }
}
