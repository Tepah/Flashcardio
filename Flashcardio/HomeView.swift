//
//  HomeView.swift
//  Flashcardio
//
//  Created by Theresa Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Flashcardio")
            .font(.title)
            .bold()
            
        NavigationView {
            VStack {
                TabView{
                    FlashcardSetListView()
                        .tabItem{
                            Label("Flashcard Sets", systemImage:"list.dash.header.rectangle")
                        }
                    Text("settings")
                        .tabItem{
                            Label("Profile", systemImage:"person.circle")
                        }
                }
            }
        }
    }
}


struct FlashcardSetListView: View {
    @State private var flashcardSets: [String] = ["Testing 1", "Set 2"]
    @State private var newSetTitle: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(flashcardSets, id: \.self) { setTitle in
                    NavigationLink(destination: FlashcardSetView(setTitle: setTitle)) {
                        Text(setTitle)
                    }
                }
            }
        }
        .navigationTitle("Flashcard Sets")
    }
}

struct FlashcardSetView: View {
    let setTitle: String
    
    var body: some View {
        Text("Flashcard Set: \(setTitle)")
    }
}

#Preview {
    HomeView()
}
