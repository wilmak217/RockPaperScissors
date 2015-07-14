//
//  SelectionViewController.swift
//  RockPaperScissors
//
//  Created by Markus Willburn on 7/13/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var playerSelectRock: UIButton!
    @IBOutlet weak var playerSelectPaper: UIButton!
    @IBOutlet weak var playerSelectScissors: UIButton!
    
    
    // Requirement #1 initiated via code command only
    @IBAction private func rockChosen(sender: UIButton){
    
        let resultsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        resultsViewController.playerSelection = getPlayerChoice(sender)
        
        presentViewController(resultsViewController, animated: true, completion: nil)
    
    
    } // End of Requirement #1 initiation method
    
    // Requirement #2 initiated via code and Seque
    
    @IBAction private func paperChosen(sender: UIButton) {
        
        performSegueWithIdentifier("whoWon", sender: sender)
        
    } // End of Requirement #2 initiation method
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "whoWon" {
            
            let resultsViewController = segue.destinationViewController as! ResultsViewController
            
            resultsViewController.playerSelection = getPlayerChoice(sender as! UIButton)
        }
    }
    
    
   
    private func getPlayerChoice(sender: UIButton) -> String{
    
        if sender == playerSelectRock{
        
            return "Rock"
            
        }
        
        else if sender == playerSelectPaper {
        
            return "Paper"
            
        }
        
        else {
        
            return "Scissors"
        
        }
    
    }
}

