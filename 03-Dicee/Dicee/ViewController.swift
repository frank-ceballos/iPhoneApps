//
//  ViewController.swift
//  Dicee
//
//  Created by Frank Ceballos on 4/28/20.
//  Copyright © 2020 Frank Ceballos. All rights reserved.
//

import UIKit // UIKit imports arc4random_uniform() and many other tools

class ViewController: UIViewController {
    
    // functions
    func updateDiceImages(){
        // Create random values
        randomDiceIndex1 = Int(arc4random_uniform(6)) // [0 1 2 3 4 5]
        randomDiceIndex2 = Int(arc4random_uniform(6)) // Casting Int32 to Int
        
        // Programatically change ImageView properties
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1]) // UIImage is a data type just like a string or integer
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    // Variables
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    // Arrays can only contain elements of the same data type
    // Index starts at 0, 1, 2, 3, 4, 5
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"] // names

    // This are IBOutlets that change the apperance of UI Elements
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // The code in this block get's executed upon opening the app
        
        updateDiceImages()
        
    }

    // This is an IBAction which notifies the code when the UI element
    // is interactive with
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // Everything inside this code block will determine what should happen
        // when this button is pressed
        
        updateDiceImages()
        
    }
    
    // Add motion detection
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}
