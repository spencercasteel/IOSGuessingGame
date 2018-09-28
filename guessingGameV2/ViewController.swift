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
        //generates a random number
    var UserTries = 4
        // the number of tries the user gets
    var newGame = false
        // starts a new game
    var wins = 0
    var loses = 0
        //number of wins and loses
    @IBOutlet weak var colorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text =    """
        Welcome to the guessing game
        enter a number between 1 and 100
        """
        promptUser.text = "\(Int(ageSlider.value))"
        //displays slider number
        restartButton.isHidden = true
        userClicked.setTitle("Enter number", for: .normal)
        restartButton.setTitle("restart", for: .normal)
        randomcolor((Any).self)
        //sets random color for start of game
        scorePrompt.text = """
        wins - loses
        \(wins) - \(loses)
        """
        //displays wins and loses
        colorButton.setTitle("color", for: .normal)
        //names color button
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        promptUser.text = "\(Int(ageSlider.value))"
    }
    //puts the value of the slider in the label for display
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
        //thinking of the game takes the input and applies it to the generated number and desides if it is correct or not, also subtracts a trie every time it runs
        print("\(randomNumber) - \(UserTries) - \(userInput)")
    }
    
    @IBAction func userRestart(_ sender: Any) {
        newGame = true
        if newGame == true {
            UserTries = 4
            randomNumber = Int(arc4random_uniform(100)) + 1
            userClicked.isHidden = false
            viewDidLoad()
        }
    }
    //resets setting when game is restarted
    
    func restart() {
        userClicked.isHidden = true
        restartButton.isHidden = false
        ageSlider.value = 50
        scorePrompt.text = """
        wins - loses
        \(wins) - \(loses)
        """
    }
    //calls restart when game is lost or won
    
    @IBAction func randomcolor(_ sender: Any) {
        let pickColor = Int(arc4random_uniform(9)) + 1
        
        switch pickColor {
        case 1:
            self.view.backgroundColor = UIColor.darkGray
            
        case 2:
            self.view.backgroundColor = UIColor.yellow
            
        case 3:
            self.view.backgroundColor = UIColor.cyan
            
        case 4:
            self.view.backgroundColor = UIColor.blue
            
        case 5:
            self.view.backgroundColor = UIColor.orange
            
        case 6:
            self.view.backgroundColor = UIColor.magenta
            
        case 7:
            self.view.backgroundColor = UIColor.purple
            
        case 8:
            self.view.backgroundColor = UIColor.gray
            
        default:
            self.view.backgroundColor = UIColor.white
        }
    }
    //picks a random color for the background
}
