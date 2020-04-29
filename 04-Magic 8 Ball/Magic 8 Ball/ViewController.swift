//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Frank Ceballos on 4/28/20.
//  Copyright © 2020 Frank Ceballos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Define arrays
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    // Variable
    var randomBallNumber : Int = 0
    
    @IBOutlet weak var ballAnswer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the ball image upon loading
        newBallImage()
    }

    // Button
    @IBAction func askButton(_ sender: UIButton) {
        newBallImage()
    }
    
    // Add hand gesture
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

    
    // Function
    func newBallImage(){
        randomBallNumber = Int(arc4random_uniform(5))
        ballAnswer.image = UIImage(named: ballArray[randomBallNumber])
    }
}

