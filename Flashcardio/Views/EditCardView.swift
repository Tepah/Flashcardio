//
//  EditCardView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/25/23.
//

import SwiftUI

class EditCardViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published var newQuestion = ""
    @Published var newAnswer = ""
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
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
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = EditCardViewModel()
    
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
        EditCardView()
    }
}
