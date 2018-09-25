//
//  ViewController.swift
//  guessingGameV2
//
//  Created by Spencer Casteel on 9/25/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var promptUser: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var userClicked: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    var randomNumber = Int(arc4random_uniform(100)) + 1
    var UserTries = 5
    var newGame = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text =    """
        Welcome to the gussing game
        enter a number between 1 and 100
        """
        promptUser.text = "\(Int(ageSlider.value))"
        restartButton.isHidden = true
        userClicked.setTitle("Enter number", for: .normal)
        restartButton.setTitle("restart", for: .normal)
         self.view.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        promptUser.text = "\(Int(ageSlider.value))"
    }
    
    @IBAction func userClicked(_ sender: Any) {
        let userInput = Int(ageSlider.value)
        
        if UserTries == 0 {
            restart()
            topLabel.text = "you lost 😩"
            promptUser.text = """
            \(randomNumber) was the correct number
            better luck next time
            """
            self.view.backgroundColor = UIColor.red
        } else if userInput == randomNumber {
            topLabel.text = "you guessed the number 😀"
            promptUser.text = """
            \(randomNumber)
            do you want to play again?
            """
             self.view.backgroundColor = UIColor.green
            restart()
        } else if userInput <= randomNumber {
            promptUser.text = """
            \(userInput) is to low
            you have \(UserTries) tries left
            """
            UserTries -= 1
        } else if userInput >= randomNumber {
            promptUser.text = """
            \(userInput) is to high
            you have \(UserTries) tries left
            """
            UserTries -= 1
        }
        print("\(randomNumber) - \(UserTries)")
    }
    
    @IBAction func userRestart(_ sender: Any) {
        newGame = true
        if newGame == true {
            UserTries = 5
            randomNumber = Int(arc4random_uniform(100)) + 1
            userClicked.isHidden = false
            viewDidLoad()
        }
    }
    
    
    func restart() {
        userClicked.isHidden = true
        restartButton.isHidden = false
        ageSlider.value = 50
    }
}