//
//  GameView.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 24/06/2022.
//

import SwiftUI

struct GameView: View {
    
    var category: TriviaCategory
    var numberOfQuestions: Int = 10
    
    @EnvironmentObject var gameObserver: TriviaQuestionsObserver
    @State var showDialog = false
    @State var showCorrectAnswer = false
    
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            if gameObserver.isLoading {
                ProgressView()
            } else {
                VStack(alignment: HorizontalAlignment.leading, spacing: 10) {
                    if let currentQuestion = gameObserver.currentQuestion {
                        Text(currentQuestion.question)
                        
                        List(gameObserver.answersToCurrentQuestion, id: \.self) { answer in
                            Text(answer)
                                .onTapGesture {
                                    showCorrectAnswer = true
                                }
                                .foregroundColor(currentQuestion.correctAnswer == answer && showCorrectAnswer ? Color.green : nil)
                        }
                        
                        HStack  {
                            if !gameObserver.isLastQuestion {
                                Button("Next") {
                                    showCorrectAnswer = false
                                    gameObserver.getNextQuestion()
                                }
                            }
                            
                            Spacer()
                            
                            if gameObserver.isLastQuestion {
                                Button("Finish") {
                                    
                                }
                            }
                        }
                    }
                }
            }
        }.task {
            await gameObserver.getQuestions(numQuestions: numberOfQuestions, for: category.categoryId)
        }.navigationTitle("Category - \(category.categoryName)")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(category: triviaCategories.first!)
    }
}
