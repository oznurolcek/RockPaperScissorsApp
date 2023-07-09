//
//  ViewController.swift
//  RockPapperScissorsApp
//
//  Created by Öznur Ölçek on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    @IBOutlet weak var rockImage: UIImageView!
    @IBOutlet weak var paperImage: UIImageView!
    @IBOutlet weak var scissorsImage: UIImageView!
    @IBOutlet weak var selectedImage: UIImageView!
    
    var userChoice : String?
    var userScore : Int = 0
    var computerScore : Int = 0

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rockImage.isUserInteractionEnabled = true
        let rockImageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickRockImage))
        rockImage.addGestureRecognizer(rockImageGestureRecognizer)
        
        paperImage.isUserInteractionEnabled = true
        let paperImageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickPaperImage))
        paperImage.addGestureRecognizer(paperImageGestureRecognizer)
        
        scissorsImage.isUserInteractionEnabled = true
        let scissorsImageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickScissorsImage))
        scissorsImage.addGestureRecognizer(scissorsImageGestureRecognizer)
        
        yourScoreLabel.text = ("Your Score: \(userScore)")
        computerScoreLabel.text = ("Computer Score: \(computerScore)")
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(deleteScores))
    }
    
    @objc func pickRockImage() {
        userChoice = "Rock"
        selectedImage.image = UIImage(named: "Rock")
    }
    
    @objc func pickPaperImage() {
        userChoice = "Paper"
        selectedImage.image = UIImage(named: "Paper")
    }
    
    @objc func pickScissorsImage() {
        userChoice = "Scissors"
        selectedImage.image = UIImage(named: "Scissors")
    }
    
    @objc func deleteScores() {
        userScore = 0
        computerScore = 0
        yourScoreLabel.text = "Your Score: 0"
        computerScoreLabel.text = "Computer Score: 0"
    }
    
    @IBAction func playButtonAct(_ sender: Any) {
        if userChoice == nil {
            showAlertMessage(title: "Something went wrong!", message: "Please make a choice.")
        }
        performSegue(withIdentifier: "toResultVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.userChoice = userChoice
            destinationVC.userScore = userScore
            destinationVC.computerScore = computerScore
        }
    }
    
    func showAlertMessage(title : String, message : String) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default) { UIAlertAction in

        }
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)

    }
    
    
}

