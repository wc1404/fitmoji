//
//  AccountRegisterViewController.swift
//  Fitmoji
//
//  Created by Nathanael Leyton on 4/16/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class AccountRegisterViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.isEnabled = false
        email.clearsOnBeginEditing = true
        username.clearsOnBeginEditing = true
        password.clearsOnBeginEditing = true
        [username, password].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
        //Query can go here to retrive email, username, and password text.
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        guard
            let email = self.email.text, !email.isEmpty,
            let user = self.username.text, !user.isEmpty,
            let pass = self.password.text, !pass.isEmpty
        else{
            self.signupButton.isEnabled = false
            return
        }
        signupButton.isEnabled = true
    }
}
