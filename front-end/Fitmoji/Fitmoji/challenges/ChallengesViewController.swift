//
//  ChallengesViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/5/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    // Challenges array..

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "ChallengeCell", bundle: nil), forCellReuseIdentifier: "challengeCell")
        
        queryChallenges()
    }
    
    func queryChallenges() {
        // Get the challenges the user is currently part of.
    }

}

// MARK: - Tableview datasource, delegate

extension ChallengesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Temporary. Return the number of challengers.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeCell
        
        // Most completed
        let participants = [Database.users[1], Database.users[3]]
        
        let exercises = [Database.exercises[0], Database.exercises[1], Database.exercises[2]]
        
        let challenge = Database.Challenge(creator: Database.users[4],
                                           type: "Most Completed",
                                           totalWorth: 30+23+45,
                                           participants: participants,
                                           exercises: exercises)
        
        cell.creatorLabel.text = "Creator: \(challenge.creator.username)"
        cell.totalLabel.text = "Total Worth: \(challenge.totalWorth)"
        cell.typeLabel.text = "Type: Most Completed"
        
        cell.participantsLabel.text = "Participants: NotAdmin, TheRock, TheStone"
        cell.exercisesLabel.text = "Exercises: Pushups, Jumprope, Sit-ups"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
          
           let delete = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
               
               // Delete or Remove the user from the challenge
           
               // Uncomment this when finished.
               //self.tableview.deleteRows(at: [indexPath], with: .fade)
           }
           
           
           return UISwipeActionsConfiguration(actions: [delete])
       }
    
    
}

