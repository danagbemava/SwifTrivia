//
//  TriviaQuestionsObserver.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import Foundation

class TriviaQuestionsObserver : ObservableObject {
    
    private var apiRepo: ITriviaRepo
    public private(set) var questions: [Question] = []
    
    @Published public private(set) var currentQuestion: Question?
    @Published public private(set) var score: Int = 0
    
    init(repo: ITriviaRepo) {
        self.apiRepo = repo
    }
    
    func getQuestions(numQuestions: Int, for category: Int) -> Void {
        let results = apiRepo.getTriviaQuestions(count: numQuestions, for: category)
        
        questions = results.questions
        questions.shuffle()
    }
    
}
