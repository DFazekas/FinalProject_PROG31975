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
    let lblMessage = UILabel()
    
    var dbData : [NSDictionary]?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        lblMessage.textAlignment = NSTextAlignment.left
        lblMessage.font = UIFont.boldSystemFont(ofSize: 30)
        lblMessage.backgroundColor = UIColor.clear
        lblMessage.textColor = UIColor.black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(lblMessage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //initialization code
    }
    
    override func layoutSubviews() {
        var f = CGRect(x: 100, y: 5, width: 460, height: 30)
        lblMessage.frame = f
        
        f = CGRect(x: 100, y: 40, width: 460, height: 20)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
