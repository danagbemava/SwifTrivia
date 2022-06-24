//
//  ContentView.swift
//  SwifTrivia
//
//  Created by Daniel Agbemava on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationStack {
            TabView {
                TriviaHomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                
                SettingsView()
                    .tabItem{
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
