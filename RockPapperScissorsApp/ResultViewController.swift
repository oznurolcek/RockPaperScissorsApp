//
//  ResultViewController.swift
//  RockPapperScissorsApp
//
//  Created by Öznur Ölçek on 9.07.2023.
//

import UIKit

let choice: [String] = ["Rock", "Paper", "Scissors"]

class ResultViewController: UIViewController {

    
    @IBOutlet weak var userChoiceImage: UIImageView!
    
    @IBOutlet weak var computerChoiceImage: UIImageView!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    var userChoice : String?
    var computerChoice = choice.randomElement()!
    
    var userScore : Int = 0
    var computerScore : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        userChoiceImage.image = UIImage(named: userChoice!)
        computerChoiceImage.image = UIImage(named: computerChoice)
        
        if ((userChoice == "Rock" && computerChoice == "Rock") || (userChoice == "Paper" && computerChoice == "Paper") || (userChoice == "Scissors" && computerChoice == "Scissors")) {
            resultImage.image = UIImage(named: "Draw")
        } else if ((userChoice == "Rock" && computerChoice == "Scissors") || (userChoice == "Scissors" && computerChoice == "Paper") || (userChoice == "Paper" && computerChoice == "Rock") ) {
            resultImage.image = UIImage(named: "Win")
            userScore += 1
        }
        else {
            resultImage.image = UIImage(named: "Lose")
            computerScore += 1
        }
        
    }
    

    @IBAction func playAgainButtonAct(_ sender: Any) {
        
        performSegue(withIdentifier: "toMainVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainVC" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.userScore = userScore
            destinationVC.computerScore = computerScore
        }
    }
    
}
