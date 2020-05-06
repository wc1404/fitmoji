//
//  FitmojiLoginViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 4/3/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class FitmojiLoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.isEnabled = false
        username.clearsOnBeginEditing = true
        password.clearsOnBeginEditing = true
        [username, password].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard
            let user = self.username.text, !user.isEmpty,
            let pass = self.password.text, !pass.isEmpty
        else{
            self.login.isEnabled = false
            return
        }
        //Query code can go here to determine if the username and password entered is valid.
        login.isEnabled = true
    }
}
