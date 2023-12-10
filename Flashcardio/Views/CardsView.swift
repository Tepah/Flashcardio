//
//  CardsView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/25/23.
//

import SwiftUI

extension View{
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct CardsView: View {
    let deckID: String
    let title: String
    
    @State private var cards = [Card]()
    @State private var isActive = true
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0 ..< cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            self.removeCard(at: index)
                        }
                        .stacked(at: index, in: self.cards.count)
                        .allowsHitTesting(index == self.cards.count - 1)
                    }
                }
                if cards.isEmpty {
                    Button("Reset Cards", action: resetCards)
                        .padding()
                        .background(Color(hex: 0x565656))
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                        .clipShape(Capsule())
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingEditScreen = true
                    })
                    {
                        Image(systemName: "plus.circle")
                            .defaultButtonStyle()
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCardView()
        }
        .background(Color(hex: 0x2E3A31))
        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        loadData()
        isActive = true
    }
    
    func loadData() {
        //        if let data = UserDefaults.standard.data(forKey: "Cards") {
        //            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
        //                self.cards = decoded
        //            }
        //        }
        getDeckData(deckID: deckID, title: "Deck") { result in
            switch result {
            case .success(let data):
                print("Document data: \(data)")
                // Handle the data here
                if let questions = data["Questions"] as? [String], let answers = data["Answers"] as? [String] {
                    // Using zip to combine corresponding elements into a list of tuples
                    let combinedList = zip(questions, answers).map { (question, answer) in
                        ["question": question, "answer": answer]
                    }

                    // Printing the resulting list
                    print(combinedList)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                // Handle the error here
            }
        }
    }
}

struct DefaultButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(hex: 0x565656))
            .clipShape(Circle())
            .shadow(radius: 20)
    }
}

extension View {
    func defaultButtonStyle() -> some View {
        modifier(DefaultButton())
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(deckID: "", title: "Hello")
    }
}
