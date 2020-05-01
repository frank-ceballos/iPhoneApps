//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank() // Question Bank Object
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display first question upon loading
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        // Checked selected answer
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        // Check answer
        checkAnswer()
        
        // Increase question number by one
        questionNumber += 1
        
        // Set question label
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = CGFloat(round((view.frame.size.width / 13.0) * CGFloat(questionNumber + 1)))
        progressBar.frame.size.width = CGFloat(round((view.frame.size.width / 13.0) * CGFloat(questionNumber + 1)))
        
    }
    

    func nextQuestion() {
        
        // Set question label
        if questionNumber <= 12 {
            // Update question label
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            // Update UI
            updateUI()

        }
        else {
            // UIAlertController Object: Pops a window
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            // UIAlectAction Object: Represents an action that can be taken when tapping a button in an alert
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            // Add action to alert
            alert.addAction(restartAction)
            
            // Present to user
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        // Get correct answer
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        // Restart from question 1
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}
