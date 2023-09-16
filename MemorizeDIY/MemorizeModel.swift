//
//  MemorizeModel.swift
//  MemorizeDIY
//
//  Created by Greg on 16.09.23.
//

import Foundation

struct Card<CardContentType> {
    
    var isFaceUp: Bool
    var content: CardContentType
}

struct MemorizeModel {
    private(set) var cards: [Card<String>] = []
    
    init(_ pairsCount: Int, cardFactory: (Int) -> Card<String>) {
        for index in 0..<pairsCount {
            let card = cardFactory(index)
            cards.append(card)
            cards.append(card)
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
