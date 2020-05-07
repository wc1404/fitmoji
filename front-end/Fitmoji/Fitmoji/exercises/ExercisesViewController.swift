//
//  ExercisesViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/3/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Initialize exercise array here
    var history = [Database.Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableview.register(UINib(nibName: "ExerciseCell", bundle: nil), forCellReuseIdentifier: "exerciseCell")
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
        
        updateScoreLabel()
        queryExercises()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    
    func queryExercises() {
        if segmentedControl.selectedSegmentIndex == 0 {
            // Query all existing admin-cteated exercises using the search text.
            // If no search text, get all exercises
            history = Database.exercises
        } else {
            // Query the exercises of the user's log using the search text.
            // If no search text, get all logs.
            history = [Database.exercises[0],Database.exercises[1],Database.exercises[3]]
            for i in 0..<history.count {
                history[i].timestamp = Date()
            }
        }
        tableview.reloadData()
    }
    
    func calculateScore() -> Int {
        return history.reduce(0) { (result, ex) -> Int in
            return result + ex.worth
        }
    }
    
    func updateScoreLabel() {
        if segmentedControl.selectedSegmentIndex == 0 {
            scoreLabel.text = ""
        } else {
          
            scoreLabel.text = "Total Score: \(calculateScore())"
        }
        tableview.reloadData()
        
        
    }
    
    @IBAction func segmentedControlChanged() {
        searchBar.text = nil
        queryExercises()
        updateScoreLabel()
    }

}

// MARK: - Tableview delegate, datasource

extension ExercisesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count // Temporary number: Return the number of exercises
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell using an exercise item
        // Get the exercise by accessing the exercise array at [indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCell
        
        let exercise = history[indexPath.row]
        cell.exerciseNameLabel.text = exercise.name
        
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.addButton.isHidden = false
            cell.timestampLabel.isHidden = true
            // Configure the exercise name..
            
            
            
        } else {
            cell.addButton.isHidden = true
            cell.timestampLabel.isHidden = false
            // Configure the exercise name and timestamp..
            
            cell.timestampLabel.text = exercise.timestamp?.description
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if segmentedControl.selectedSegmentIndex == 0{
            return nil
        }
        
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            // Remove the exercise log from the database
            
            
            
            //self.tableview.deleteRows(at: [indexPath], with: .fade)
        
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
}

// MARK: - Search bar delegate

extension ExercisesViewController: UISearchBarDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchBar.searchTextField {
            queryExercises()
            searchBar.resignFirstResponder()
        }
        
        return true
    }
}
