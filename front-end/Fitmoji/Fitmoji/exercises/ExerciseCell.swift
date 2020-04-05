//
//  ExerciseCell.swift
//  Fitmoji
//
//  Created by John Martinez on 4/3/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addTapped() {
        // Add the exercise to the user's exercise log. 
    }
    
}
