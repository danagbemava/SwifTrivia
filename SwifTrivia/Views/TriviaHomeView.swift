//
//  TriviaHomeView.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 23/06/2022.
//

import SwiftUI

struct TriviaHomeView: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 20) {
            Text("Welcome to SwifTrivia")
            NavigationLink {
                TriviaCategoryView()
            } label: {
                Text("Start Game")
            }
        }
    }
}

struct TriviaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaHomeView()
    }
}
