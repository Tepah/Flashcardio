//
//  HomeView.swift
//  Flashcardio
//
//  Created by Theresa Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                .navigationTitle("Flashcardio")
                .navigationBarTitleDisplayMode(.inline)
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
            
            Section {
                TextField("New Set", text: $newSetTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Create a new set") {
                    if !newSetTitle.isEmpty {
                        flashcardSets.append(newSetTitle)
                        newSetTitle = ""
                    }
                }
                .disabled(newSetTitle.isEmpty)
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
