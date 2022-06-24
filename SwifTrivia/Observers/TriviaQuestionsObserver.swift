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
    @Published public private(set) var isLoading = true;
    @Published public private(set) var isLastQuestion = false;
    @Published public private(set) var answersToCurrentQuestion: [String] = []
    
    init(repo: ITriviaRepo) {
        self.apiRepo = repo
    }
    
    func getQuestions(numQuestions: Int, for category: Int?) async -> Void {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        questions = await apiRepo.getTriviaQuestions(count: numQuestions, for: category).questions
        if !questions.isEmpty {
            questions.shuffle()
            DispatchQueue.main.async {
                self.currentQuestion = self.questions.first
                if let answers = self.currentQuestion?.allAnswers {
                    self.answersToCurrentQuestion = answers.shuffled()
                }
            }
        }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func getNextQuestion() {
        let currentQuestionIndex = questions.firstIndex{$0 == currentQuestion}
        
        if let currentQuestionIndex = currentQuestionIndex {
            if currentQuestionIndex < (questions.count - 1) {
                currentQuestion = questions[currentQuestionIndex + 1]
                if let answers = currentQuestion?.allAnswers {
                    self.answersToCurrentQuestion = answers.shuffled()
                }
            }
            isLastQuestion = (currentQuestionIndex == questions.count - 1)
        }
        
    }
    
    func isAnswerCorrect(choice: String) -> Bool {
        if let currentQuestion = currentQuestion {
            return choice == currentQuestion.correctAnswer
        }
        
        return false
    }
    
//    func startGame() {
//        currentQuestion = questions.first
//    }
}
