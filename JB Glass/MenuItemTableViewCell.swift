//
//  MenuItemTableViewCell.swift
//  MOBI KIET Attendance
//
//  Created by Kunwar Anirudh Singh on 20/08/17.
//  Copyright © 2017 Kunwar Anirudh Singh. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

