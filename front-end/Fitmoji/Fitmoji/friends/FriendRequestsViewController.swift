//
//  FriendRequestsViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/4/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class FriendRequestsViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!

    // Add the requests array
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        
        queryRequests()
    }
    
    func queryRequests() {
        // Fill the requests array
    }


}

// MARK: - Tableview datasource, delegate

extension FriendRequestsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Temporary. Return the number of requests
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.button.isHidden = true
        
        // Configure the cell with the request at [indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
       
        let decline = UIContextualAction(style: .destructive, title: "Decline") { (_, _, _) in
            
            // Decline the request
        
            // Uncomment this when finished.
            //self.tableview.deleteRows(at: [indexPath], with: .fade)
        }
        
        let accept = UIContextualAction(style: .normal, title: "Accept") { (_, _, _) in
            // Accept the request
            
            // Uncomment this when finished.
            //self.tableview.deleteRows(at: [indexPath], with: .fade)
        
        }
        
        return UISwipeActionsConfiguration(actions: [decline, accept])
    }
    
    
}
