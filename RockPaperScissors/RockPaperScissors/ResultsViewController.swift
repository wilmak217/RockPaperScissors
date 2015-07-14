//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Markus Willburn on 7/13/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController{
    
    @IBOutlet weak var gameOutcome: UIImageView!
    @IBOutlet weak var outcomeMessage: UILabel!
    
    
    //Choice Selection variables
    var playerSelection: String!
    var cpuChoice: String!
    
    
    override func viewWillAppear(animated: Bool){
     super.viewWillAppear(animated)
    
        let interpretedChoices = ["Rock", "Paper", "Scissors"]
        let randomSelector = Int(arc4random() % 3)
        cpuChoice = interpretedChoices[randomSelector]
        
        displayResult()
    }
    
    
    func displayResult(){
    
        var imageName: String
        var text: String
        var outcome: Bool = false
        let matchup = "\(playerSelection)   vs. \(cpuChoice)"
        
        
        if playerSelection == cpuChoice{
            gameOutcome.image = UIImage(named: "Tie")
            outcomeMessage.textColor = UIColor(red: 0.0, green: 0.0, blue: 255.0, alpha: 0.0)
            outcomeMessage.text = "\(matchup): ends in a tie!"
            return
        }

        switch (playerSelection){
        
        case "Rock":
            
            outcome = cpuChoice == "Scissors"
            
        case "Paper":
            
            outcome = cpuChoice == "Rock"
            
        default:
            
            outcome = cpuChoice == "Paper"
            
        }
        
        if outcome{
          
            text = "You Win! \(matchup)"
            imageName = "\(playerSelection)-\(cpuChoice)".lowercaseString
        }
        
        else{
        
            text = "You Lost! \(matchup)"
            imageName = "\(cpuChoice)-\(playerSelection)".lowercaseString
    
        }
        
        // Update the UILabel and UIImage
        gameOutcome.image = UIImage(named: imageName)
        outcomeMessage.text = text
        
        
    }
    
    /* Dismissal of ResultsViewController upon pressing Play Again button to allow for player to play again */

    @IBAction func playAgain() {
    
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
