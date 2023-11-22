//
//  Card.swift
//  Flashcardio
//
//  Created by Justin Nguyen on 11/21/23.
//

import Foundation

struct Card: Codable {
    let question: String
    let answer: String
    
    static var example: Card {
        Card(question: "Question", answer: "Answer")
    }
}
