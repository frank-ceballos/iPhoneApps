//
//  Question.swift
//  Quizzler
//
//  Created by Frank Ceballos on 4/29/20.
//  Copyright © 2020 Frank Ceballos. All rights reserved.
//

import Foundation

// For a class the first letter should be capitalize
// For objects use lower case letters

// A class is a blueprint.
// An object is an actual object built using the class / blueprint

// Objects haves properties: Number of doors, number of seats
// Object have actions: How does the car drive? How does the car turn left
// Object responds to events: When it rains, should the wipers turn on?


class Question {
    
    // Properties of Question Class
    let questionText : String
    let answer : Bool
    
    // Initialization code using the init method
    init(text : String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
