//
//  ChallengeCell.swift
//  Fitmoji
//
//  Created by John Martinez on 4/5/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class ChallengeCell: UITableViewCell {
    
    @IBOutlet weak var creatorLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var exercisesLabel: UILabel!
    
    @IBOutlet weak var participantsLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
