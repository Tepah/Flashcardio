//
//  CreateSetView.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 12/3/23.
//
import SwiftUI
import Firebase
import FirebaseAuth

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct CreateSetView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var title: String = ""
    @State private var newSet: [(String, String)] = []
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showErrorModal: Bool = false
    @State private var page: Int = 1

    
    var body: some View {
        NavigationView {
            BgView()
                .overlay(
            VStack {
                Spacer()
                TextField("", text: $title)
                    .placeholder(when: title.isEmpty) {
                        HStack {
                            Spacer()
                            Text("Title").foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x7399a4))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("", text: $question)
                            .placeholder(when: question.isEmpty) {
                                HStack {
                                    Spacer()
                                    Text("Question").foregroundColor(.white)
                                    Spacer()
                                }
                            }
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x7399a4))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("", text: $answer)
                            .placeholder(when: answer.isEmpty) {
                                HStack {
                                    Spacer()
                                    Text("Answer").foregroundColor(.white)
                                    Spacer()
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                HStack {
                    if page <= 1 {
                        Spacer()
                        Text("  ")
                            .font(.title)
                        Text("\(page)")
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                            .font(.title)
                        Button(">") {
                            nextButton()
                        }
                        .foregroundColor(.white)
                        .font(.title)
                        Spacer()
                    } else {
                        Button("<") {
                            backButton()
                        }
                        .foregroundColor(.white)
                        .font(.title)
                        Text("\(page)")
                            .padding(.horizontal, 10)
                            .foregroundColor(.white)
                            .font(.title)
                        Button(">") {
                            nextButton()
                        }
                        .font(.title)
                        .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 10)
                Spacer()
                Button("Save") {
                    saveButton()
                }
                .padding()
                .background(Color(hex: 0x7399a4))
                .foregroundColor(.white)
                .cornerRadius(10)
                .bold()
                
            })
            //.padding()
            .alert(isPresented: $showErrorModal) {
                Alert(
                    title: Text("Invalid card"),
                    message: Text("Please have a title and complete both cards"),
                    dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func saveButton() {
        if title == "" {
            showErrorModal = true
        } else if newSet.count == page-1 {
            if (question == "" || answer == "") && newSet.isEmpty {
                showErrorModal = true
            } else if (question == "" || answer == "") && !newSet.isEmpty {
                saveDeck(title: title, deck: newSet)
                self.presentationMode.wrappedValue.dismiss()
            } else {
                newSet.append((question, answer))
                saveDeck(title: title, deck: newSet)
                self.presentationMode.wrappedValue.dismiss()
            }
        } else {
            if question != newSet[page-1].0 || answer != newSet[page-1].1 {
                newSet[page-1].0 = question
                newSet[page-1].1 = answer
            }
            saveDeck(title: title, deck: newSet)
            self.presentationMode.wrappedValue.dismiss()
        }
        print(newSet)
    }
    
    func nextButton() {
        // Next page or add card
        print("Next Button")
        if question == "" || answer == "" {
            showErrorModal = true
            return
        }
        if newSet.count < page {
            print("Fail1")
            addCard()
            page += 1
        } else {
            print("Fail2")
            if question != newSet[page-1].0 || answer != newSet[page-1].1 {
                newSet[page-1].0 = question
                newSet[page-1].1 = answer
            }
            page += 1
            changeCard()
        }
        print(newSet)
    }
    
    func backButton() {
        print("Back Button")
        if (question != "" || answer != "") && newSet.count < page {
            print("test 1")
            addCard()
        } else if (question != "" || answer != "") && newSet.count < page {
            print("test 2")
            if question != newSet[page-1].0 || answer != newSet[page-1].1 {
                newSet[page-1].0 = question
                newSet[page-1].1 = answer
            }
        }
        page -= 1
        changeCard()
        print(newSet)
    }
    
    
    func addCard() {
        print("Add Card")
        newSet.append((question, answer))
        question = ""
        answer = ""
    }
    
    func changeCard() {
        print("Card Change")
        print(page)
        print(newSet.count)
        if newSet.count < page {
            question = ""
            answer = ""
        } else {
            question = newSet[page-1].0
            answer = newSet[page-1].1
        }
    }
                        
}


func saveDeck(title: String, deck: [(String, String)]) {
    let inputDeck = checkDeck(deck:deck)
    if inputDeck.isEmpty { return }
    let db = Firestore.firestore()
    let collectionRef = db.collection("Decks")
    let documentRef = collectionRef.document()
    let data = ["UserID": getUserId(), "Title": title, "Questions": inputDeck.map { $0.0 }, "Answers": inputDeck.map {$0.1} ] as [String : Any]
    documentRef.setData(data) { error in
        if let error = error {
            print("Error uploading array: \(error.localizedDescription)")
        } else {
            print("Deck uploaded successfully!")
        }
    }
    
}

func checkDeck(deck: [(String, String)]) -> [(String, String)] {
    if deck.last!.0 == "" || deck.last!.1 == "" {
        return Array(deck.dropLast())
    } else {
        return deck
    }
    
}

#Preview {
    CreateSetView()
}
