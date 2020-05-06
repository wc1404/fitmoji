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
//        continueButton.isEnabled = false
        height.clearsOnBeginEditing = true
        weight.clearsOnBeginEditing = true
        month.clearsOnBeginEditing = true
        day.clearsOnBeginEditing = true
        year.clearsOnBeginEditing = true
        if(hasChanged()){
            continueButton.isEnabled = true
        }
    }
    func hasChanged() -> Bool{
        return (fitLabel.text != "#" && bmiLabel.text != "#")
    }
    @IBAction func calculateBMI(_ sender: Any) {
        let weightKg = Double(weight.text!)! * 0.45359237
        let heightMeter = Double(height.text!)! * 0.0254
        let bmi = weightKg / pow(heightMeter, 2)
        let shortenedBmi = String(format: "%.1f", bmi)
        bmiLabel.text = String(shortenedBmi)
        //Query code to retrive bmi can go here.
    }
    
    @IBAction func calcFit(_ sender: Any) {
        //This is a placeholder, real calculations to determine the fitness level need to occur.
        fitLabel.text = "Beginner"
        //Query code to retrive fitness level can go here.
    }
}
