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
    @State private var newSet: [[String: Any]] = []
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showErrorModal: Bool = false
    @State private var page: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text(title)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("Question", text: $question)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: 0x565656))
                    .frame(width: 340, height: 160)
                    .overlay(
                        TextField("Answer", text: $answer)
                            .foregroundColor(.white)
                            .font(.title)
                    )
                HStack {
                    if page <= 1 {
                        Text(page)
                        Text(">")
                    }
                }
            }
            .padding()
            .alert(isPresented: $showErrorModal) {
                Alert(
                    title: Text("Account not found"),
                    message: Text("Please put in a valid account"),
                    dismissButton: .default(Text("OK")))
            }
        }
    }
    
}


#Preview {
    CreateSetView()
}
