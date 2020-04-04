//
//  UserCell.swift
//  Fitmoji
//
//  Created by John Martinez on 4/4/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonTapped() {
        // What this does depends on where the cell appears. 
    }
    
}
