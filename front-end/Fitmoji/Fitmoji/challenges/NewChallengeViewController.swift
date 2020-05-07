//
//  NewChallengeViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/5/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class NewChallengeViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableview: UITableView!
    
    let challengeTypes = Database.challengeTypes
    
    // Add the Friends array
    var friends = [Database.users[1], Database.users[3]]
    
    // Add the Exercises array
    var exercises = Database.exercises

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.register(UINib(nibName: "ExerciseCell", bundle: nil), forCellReuseIdentifier: "exerciseCell")
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableview.delegate = self
        tableview.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @IBAction func segmentedControlChanged() {
        tableview.reloadData()
    }
    
    @IBAction func saveTapped() {
        // Save the challenge to the database
        navigationController?.popViewController(animated: true)
    }
    
    

}

// MARK: - Tableview datasource, delegate

extension NewChallengeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return exercises.count
        } else {
            return friends.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCell
            cell.timestampLabel.isHidden = true
            cell.addButton.isHidden = false
            
            let ex = exercises[indexPath.row]
            
            // Access the exercise array at indexPath and configure the cell
            cell.exerciseNameLabel.text = "\(ex.name) (\(ex.worth))"
            
            return cell
        } else {
            let cell = tableview.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
            cell.button.isHidden = false
            cell.scoreLabel.isHidden = true
            cell.button.setTitle("Add", for: .normal)
            
            cell.profilePic.image = friends[indexPath.row].profilePic
            cell.userNameLabel.text = friends[indexPath.row].username
            
            return cell
        }
    }
    
    
}


// MARK: - Pickerview datasource, delegate

extension NewChallengeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return challengeTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = view as? UILabel ?? UILabel()
           
      
        label.text = challengeTypes[row]
        label.textAlignment = .center
           
        return label
    }
    
    
}
