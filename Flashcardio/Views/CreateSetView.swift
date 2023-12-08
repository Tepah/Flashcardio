//
//  CreateSetView.swift
//  Flashcardio
//
//  Created by Pete Potipitak on 12/3/23.
//
import SwiftUI
import Firebase
import FirebaseAuth

struct CreateSetView: View {
    @State private var title: String = "New Deck"
    @State private var newSet: [(String, String)] = []
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showErrorModal: Bool = false
    @State private var page: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.title)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("Question", text: $question)
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("Answer", text: $answer)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                HStack {
                    if page <= 1 {
                        Text("\(page)")
                        Button(">") {
                            nextButton()
                        }
                    } else {
                        Button("<") {
                            backButton()
                        }
                        Text("\(page)")
                        Button(">") {
                            nextButton()
                        }
                    }
                }
            }
            .padding()
            .alert(isPresented: $showErrorModal) {
                Alert(
                    title: Text("Invalid card"),
                    message: Text("Please complete both cards"),
                    dismissButton: .default(Text("OK")))
            }
        }
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
        if (question != "" || answer != "") && newSet.count == page {
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
        if newSet.count == page+1 {
            question = ""
            answer = ""
        } else {
            question = newSet[page-1].0
            answer = newSet[page-1].1
        }
    }
}


#Preview {
    CreateSetView()
}
