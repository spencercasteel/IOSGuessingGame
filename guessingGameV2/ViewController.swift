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
    @IBOutlet weak var scorePrompt: UILabel!
    var randomNumber = Int(arc4random_uniform(100)) + 1
    var UserTries = 4
    var newGame = false
    var wins = 0
    var loses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text =    """
        Welcome to the guessing game
        enter a number between 1 and 100
        """
        promptUser.text = "\(Int(ageSlider.value))"
        restartButton.isHidden = true
        userClicked.setTitle("Enter number", for: .normal)
        restartButton.setTitle("restart", for: .normal)
        self.view.backgroundColor = UIColor.darkGray
        scorePrompt.text = """
        wins - loses
        \(wins) - \(loses)
        """
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        promptUser.text = "\(Int(ageSlider.value))"
    }
    
    @IBAction func userClicked(_ sender: Any) {
        let userInput = Int(ageSlider.value)
        
        if userInput == randomNumber {
            wins += 1
            topLabel.text = "you guessed the number 😀"
            promptUser.text = """
            \(randomNumber)
            do you want to play again?
            """
            self.view.backgroundColor = UIColor.green
            restart()
        } else if UserTries == 0 {
            loses += 1
            topLabel.text = "you lost 😩"
            promptUser.text = """
            \(randomNumber) was the correct number
            better luck next time
            """
            self.view.backgroundColor = UIColor.red
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
        scorePrompt.text = """
        wins - loses
        \(wins) - \(loses)
        """
    }
}
