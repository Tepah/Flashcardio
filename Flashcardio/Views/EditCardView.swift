//
//  EditCardView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/25/23.
//

import SwiftUI
import FirebaseFirestore

class EditCardViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published var newQuestion = ""
    @Published var newAnswer = ""
    
    var deckID: String
    var title: String

    init() {
        self.deckID = ""
        self.title = ""
        loadData()
    }
    
    init(deckID: String, title: String) {
        self.deckID = deckID
        self.title = title
        loadData()
    }
    
    func loadData() {
        print(deckID)
        getDeckData(deckID: deckID, title: "Deck") { result in
            switch result {
            case .success(let data):
                print("Document data: \(data)")
                // Handle the data here
                if let questions = data["Questions"] as? [String], let answers = data["Answers"] as? [String] {
                    // Using zip to combine corresponding elements into a list of tuples
                    let combinedList = zip(questions, answers).map { (question, answer) in
                        Card(question: question, answer: answer)
                    }

                    // Printing the resulting list
                    self.cards = combinedList
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                // Handle the error here
            }
        }
    }
    
    func saveData() {
//        if let data = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.set(data, forKey: "Cards")
//        }
        getDeckData(deckID: deckID, title: "Deck") { result in
            switch result {
            case .success(let data):
                print("Document data: \(data)")
                // Handle the data here
                if let questions = data["Questions"] as? [String], let answers = data["Answers"] as? [String] {
                    _ = zip(questions, answers).map { (question, answer) in
                        Card(question: question, answer: answer)
                    }
                    var answers = []
                    var questions = []
                    for card in self.cards {
                        questions.append(card.question)
                        answers.append(card.answer)
                    }
                    var newData = data
                    newData["Questions"] = questions
                    newData["Answers"] = answers
                    print(newData)
    
                    updateDeck(deckID: self.deckID, updatedDeck: newData)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                // Handle the error here
            }
        }
    }
    
    func addCard() {
        let card = Card(question: newQuestion, answer: newAnswer)
        cards.insert(card, at: 0)
        saveData()
        newQuestion = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    
}

struct EditCardView: View {
    let deckID: String
    let title: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = EditCardViewModel()
    
    init(deckID: String, title: String) {
        self.deckID = deckID
        self.title = title
        _viewModel = StateObject(wrappedValue: EditCardViewModel(deckID: deckID, title: title))
        }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add new card")) {
                    TextField("Question", text: $viewModel.newQuestion)
                    TextField("Answer", text: $viewModel.newAnswer)
                    Button("Add card", action: viewModel.addCard)
                }
                Section {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(viewModel.cards[index].question)
                                .font(.headline)
                            Text(viewModel.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: viewModel.removeCards)
                }
                Section {
                    Button("Delete Deck", action: {
                        deleteDeck(deckID: deckID)
                        presentationMode.wrappedValue.dismiss()
                    })
                    .foregroundColor(.red)
                }
            }
            .navigationBarTitle("Edit Cards")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
            .listStyle(GroupedListStyle())
            .onAppear(perform: viewModel.loadData)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(deckID: "", title: "")
    }
}
