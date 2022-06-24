//
//  Category.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 23/06/2022.
//

import Foundation

struct TriviaCategory : Identifiable, Hashable {
    
    var categoryName: String
    var categoryId: Int?
    var id = UUID()
}

let triviaCategories: [TriviaCategory] = [
    TriviaCategory(categoryName: "Random", categoryId: nil),
    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
    TriviaCategory(categoryName: "Books", categoryId: 10),
    TriviaCategory(categoryName: "Film", categoryId: 11),
    TriviaCategory(categoryName: "Music", categoryId: 12),
    TriviaCategory(categoryName: "Musicals & Theatre", categoryId: 13),
    TriviaCategory(categoryName: "Television", categoryId: 14),
    TriviaCategory(categoryName: "Video Games", categoryId: 15),
    TriviaCategory(categoryName: "Board Games", categoryId: 16),
    TriviaCategory(categoryName: "Science & Nature", categoryId: 17),
    TriviaCategory(categoryName: "Computers", categoryId: 18),
    TriviaCategory(categoryName: "Mathematics", categoryId: 19),
    TriviaCategory(categoryName: "Mythology", categoryId: 20),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),
//    TriviaCategory(categoryName: "General Knowlegde", categoryId: 9),6yyyy
]
