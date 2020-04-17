//
//  HealthRegisterViewController.swift
//  Fitmoji
//
//  Created by Nathanael Leyton on 4/16/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit

class HealthRegisterViewController: UIViewController {
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var bmiButton: UIButton!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var fitButton: UIButton!
    @IBOutlet weak var fitLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
        if(hasChanged()){
            continueButton.isEnabled = true
        }
        // Do any additional setup after loading the view.
    }
    func hasChanged() -> Bool{
        return (fitLabel.text != "0" && bmiLabel.text != "0")
    }
    @IBAction func calculateBMI(_ sender: Any) {
        //        var w = Int(weightInput.text!)!
        //        var h = Int(heightInput.text!)!
        //        print(w)
        //        print(h)
        //        var sum = ((w / (h * h)) * 703)
        //        print(sum)
        //        bmiLabel.text = String(sum)
    }
    
    @IBAction func calcFit(_ sender: Any) {
        //Code to determine the fitness level based on the calculated bmi and birthdate
         //bmiLabel.text This is where the calbulated bmi is saved.
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
