//
//  CardView.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/21/23.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var removal: (() -> Void)? = nil

    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(hex: 0x7399a4))
                .frame(width: 340, height: 160)
                .background(
                    differentiateWithoutColor ? nil :
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.red)
                )
                .shadow(radius: 20)
            VStack {
                if isShowingAnswer && !isDefinitionFirst {
                    Text(card.answer)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(180))
                        .scaleEffect(x: -1, y: 1)
                } else if !isShowingAnswer && isDefinitionFirst {
                    Text(card.answer)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                } else if isShowingAnswer && isDefinitionFirst {
                    Text(card.question)
                        .font(.largeTitle)
                        .rotationEffect(.degrees(180))
                        .foregroundColor(.white)
                        .scaleEffect(x: -1, y: 1)
                } else {
                    Text(card.question)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .accessibility(addTraits: .isButton)
        .onTapGesture {
            withAnimation(.easeInOut) {
                self.isShowingAnswer.toggle()
            }
        }
        .rotation3DEffect(
            .degrees(isShowingAnswer ? 180 : 0), axis: (x: 1, y: 0, z: 0)
        )
        .frame(width: 340, height: 160)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width, y: 0)
        .opacity(2 - Double(abs(offset.width / 100)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                    self.feedback.prepare()
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        self.removal?()
                    } else {
                        self.offset = CGSize.zero
                    }
                    
                }
        )
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
