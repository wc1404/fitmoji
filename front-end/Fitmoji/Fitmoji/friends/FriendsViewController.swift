//
//  FriendsViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/4/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    // Add friend array here
    var friends = [Database.users[1], Database.users[3]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        queryFriends()
    }
    
    func queryFriends() {
        // Fill the array
    }
    
}

// MARK: - Tableview datasource, delegate

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // Temporary.. return the friend count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.button.isHidden = true
        
        cell.profilePic.image = friends[indexPath.row].profilePic
        cell.userNameLabel.text =  friends[indexPath.row].username
        cell.scoreLabel.text = "\(friends[indexPath.row].fitnessLevel) (\(friends[indexPath.row].score))"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            // Remove the friend relatiobship from the database
            
            //self.tableview.deleteRows(at: [indexPath], with: .fade)
        
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
}
