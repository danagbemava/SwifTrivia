//
//  TriviaCategoryView.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 23/06/2022.
//

import SwiftUI

struct TriviaCategoryView: View {
    
    @EnvironmentObject var observer: TriviaQuestionsObserver
    
    var body: some View {
        List(triviaCategories) { category in
            NavigationLink(category.categoryName) {
                GameView(category: category)
                    .environmentObject(observer)
            }
        }
        .navigationDestination(for: TriviaCategory.self) { cat in
            Text(cat.categoryName)
        }
        .navigationTitle("Select Category")
    }
}

struct TriviaCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaCategoryView()
    }
}
