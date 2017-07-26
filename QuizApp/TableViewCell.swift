//
//  TableViewCell.swift
//  QuizApp
//
//  Created by Nitish Dash on 26/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
