//
//  ChallengersViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/5/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class ChallengersViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    // Challengers array

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "ChallengeCell", bundle: nil), forCellReuseIdentifier: "challengeCell")
        queryChallengers()
    }
    
    func queryChallengers() {
        // Fill the challengers array
    }

}

extension ChallengersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Temporary. Return the number of challengers. 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
          
           let decline = UIContextualAction(style: .destructive, title: "Decline") { (_, _, _) in
               
               // Decline the challenge
           
               // Uncomment this when finished.
               //self.tableview.deleteRows(at: [indexPath], with: .fade)
           }
           
           let accept = UIContextualAction(style: .normal, title: "Accept") { (_, _, _) in
               // Accept the challenge
               
               // Uncomment this when finished.
               //self.tableview.deleteRows(at: [indexPath], with: .fade)
           
           }
           
           return UISwipeActionsConfiguration(actions: [decline, accept])
       }
    
    
}
