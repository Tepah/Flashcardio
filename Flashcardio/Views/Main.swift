//
//  Main.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/20/23.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

struct Main: View {
    @State private var showSettingsScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                        self.showSettingsScreen = true
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 20, height: 3)
                                .foregroundColor(.white)
                                .offset(y: -6)
                            
                            Rectangle()
                                .frame(width: 20, height: 3)
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .frame(width: 20, height: 3)
                                .foregroundColor(.white)
                                .offset(y: 6)
                        }
                        .padding()
                    }
                    .padding()
                }
                GeometryReader { geometry in
                    Text("Flashcardio")
                        .font(.largeTitle) // Set your desired font size here
                        .frame(width: geometry.size.width, height: 0)
                        .foregroundColor(Color.white)
                }
                .listRowBackground(Color(hex: 0x2E3A31))
                ShowUsersDecks()
                // Add card button
                AddCard().listRowBackground(Color(hex: 0x2E3A31)).contentShape(Rectangle())
            }
            .background(Color(hex: 0x2E3A31))
            .sheet(isPresented: $showSettingsScreen) {
                SettingsView()
            }
        }
    }
}



struct ShowUsersDecks: View {
    @StateObject private var decks = MyDataViewModel()
    
    var body: some View {
        List(decks.myDataList) { deck in
            FlashCardSet(title: deck.Title, deckID: deck.id!).listRowBackground(Color(hex: 0x2E3A31))
        }
        .listStyle(PlainListStyle())
        .onAppear {
            decks.loadData(forUserId: getUserId())
        }
    }
}

// work in progress
struct FlashCardSet: View {
    let title: String
    let deckID: String
    
    var body: some View {
        NavigationLink(destination: CardsView(deckID: deckID, title: title)) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 310, height: 130)
                    .opacity(0.6)
                    .offset(y: 30)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 325, height: 140)
                    .opacity(0.7)
                    .offset(y: 15)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 340, height: 160)
                    .overlay(
                        Text(title)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .offset(x: 0, y: 0)
            }
        }
    }
}

struct AddCard: View {
    var body: some View {
        NavigationLink(destination: CreateSetView()) {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 265, height: 110)
                    .opacity(0.7)
                    .overlay(
                        Text("+")
                            .foregroundColor(.white)
                            .font(.title)
                    )
                Spacer()
            }
        }
    }
}

struct TempView: View {
    var body: some View {
        VStack {
            Text("Nothing to see here..")
        }
    }
}

#Preview {
    Main()
}
