//
//  LeaderboardViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/4/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!

    // Add leader array
    var leaders = Database.users
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        
        queryLeaders()
    }
    
    func queryLeaders() {
        // Fill the leader array, sort by score
        leaders.sort { (u0, u1) -> Bool in
            u0.score > u1.score
        }
    }
    
}

// MARK: - Tableview datasource, delegate

extension LeaderboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.button.isHidden = true
        
        cell.profilePic.image = leaders[indexPath.row].profilePic
        cell.userNameLabel.text =  leaders[indexPath.row].username
        cell.scoreLabel.text = "\(leaders[indexPath.row].fitnessLevel) (\(leaders[indexPath.row].score))"
        
        
        return cell
    }
    
    
}
