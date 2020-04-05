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
    }
    
}

// MARK: - Tableview datasource, delegate

extension LeaderboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Temporary, return the leader count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.button.isHidden = true
        
        // Configure the cell with the leader at [indexPath.row]
        
        
        return cell
    }
    
    
}
