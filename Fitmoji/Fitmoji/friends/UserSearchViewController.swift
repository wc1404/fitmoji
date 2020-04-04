//
//  UserSearchViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/4/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    
    // Add a user array..

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
    }
    
    func queryUsers() {
        // Fill the array, querying them via the searchbar text.
    }

}

// MARK: - Tableview datasource, delegate

extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // Temporary. Return the number of users
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.button.titleLabel?.text = "Request"
        
        // Configure the cell with the user at [indexPath.row]
        
        
        return cell

    }
    
    
}

// MARK: - Search bar delegate

extension UserSearchViewController: UISearchBarDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchBar.searchTextField {
            queryUsers()
            searchBar.resignFirstResponder()
        }
        
        return true
    }
}
