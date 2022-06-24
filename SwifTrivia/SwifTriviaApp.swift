//
//  SwifTriviaApp.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import SwiftUI

@main
struct SwifTriviaApp: App {
    
    @StateObject var observer = TriviaQuestionsObserver(repo: TriviaRepo())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(observer)
        }
    }
}
