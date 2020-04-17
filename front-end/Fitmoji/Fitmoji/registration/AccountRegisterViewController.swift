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
        if(validateInput(email: email, uname: username, pword: password)){
            signupButton.isEnabled = true
        }
    }
    func validateInput(email: UITextField, uname: UITextField, pword: UITextField) -> Bool{
           //add necessary code to validate login
           return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
