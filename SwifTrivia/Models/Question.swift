//
//  Question.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

//{
//      "category": "Entertainment: Books",
//      "type": "multiple",
//      "difficulty": "hard",
//      "question": "Which author co-wrote &quot;The Communist Manifesto&quot; alongside Karl Marx?",
//      "correct_answer": "Friedrich Engels",
//      "incorrect_answers": [
//        "Robert Owen",
//        "Alexander Kerensky",
//        "Paul Lafargue"
//      ]
//    }

struct Question : Codable {
    
    var category: String
    var type: String
    var difficulty: Difficulty
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    var allAnswers: [String]  {
        get {
            var newArray: [String] = []
            incorrectAnswers.forEach {
                newArray.append($0)
            }
            newArray.append(correctAnswer)
            newArray.shuffle()
            return newArray
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case category
        case type
        case difficulty
        case question
        
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
