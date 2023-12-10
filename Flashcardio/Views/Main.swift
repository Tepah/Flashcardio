//
//  Main.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 11/20/23.
//

import SwiftUI
import FirebaseAuth

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
    var body: some View {
        NavigationView {
            VStack {
                // Put cards per card on account here !!!right now placeholder
                List {
                    GeometryReader { geometry in
                                        Text("Flashcardio")
                                            .font(.largeTitle) // Set your desired font size here
                                            .frame(width: geometry.size.width, height: 0)
                                            .foregroundColor(Color.white)
                                    }
                    .listRowBackground(Color(hex: 0x2E3A31))
                    .padding(.vertical, 10)
                    FlashCardSet(title: "tempoary name 1").listRowBackground(Color(hex: 0x2E3A31))
                    FlashCardSet(title: "tempoary name 2").listRowBackground(Color(hex: 0x2E3A31))
                    FlashCardSet(title: "tempoary name 3").listRowBackground(Color(hex: 0x2E3A31))
                    FlashCardSet(title: "tempoary name 4").listRowBackground(Color(hex: 0x2E3A31))
                    // Add card button
                    AddCard().listRowBackground(Color(hex: 0x2E3A31)).contentShape(Rectangle())
                    // Temporary log out button lol
                    Button("Logout") {
                        logoutLogic()
                    }
                }
                .listStyle(PlainListStyle())
            }
            .background(Color(hex: 0x2E3A31))
        }
    }
}

// work in progress
struct FlashCardSet: View {
    let title: String
    
    var body: some View {
        NavigationLink(destination: TempView()) {
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

func logoutLogic() {
    do {
        try Auth.auth().signOut()
        print("Logged out successfully.")
    } catch let signOutError as NSError {
        print("Error signing out: \(signOutError.localizedDescription)")
    }
}

#Preview {
    Main()
}
