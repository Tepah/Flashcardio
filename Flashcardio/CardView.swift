//
//  CardView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/21/23.
//

import SwiftUI

struct CardView: View {
    
    let card: Card

    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: 0x565656))
                .frame(width: 340, height: 160)
                .offset(x: 0, y: 0)
                .shadow(radius: 20)
            VStack {
                Text(card.question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .accessibility(addTraits: .isButton)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .animation(.spring()) // can't figure out how to use withAnimation or animation(_:value:)
        // need to work on .gesture() for removing a card
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
