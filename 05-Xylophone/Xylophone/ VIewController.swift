//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // Audio Video Foundation Library


class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    // Define audio player
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // To access the tag property of sender of type UIButton
        // use "sender.tag"
        // sender is just a variable of type UIButton
        
        // Call playSound
        playSound(tagNumber: sender.tag)
    }
    
    func playSound(tagNumber: Int) {
        // Get file location
        let soundURL = Bundle.main.url(forResource: "note\(tagNumber)", withExtension: "wav")
        
        // Insert "CD"/ audio file to CD Player
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        // Play Audio with CD Player
        audioPlayer.play()
    }
    
}

