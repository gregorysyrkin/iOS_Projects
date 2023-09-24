//
//  MemorizeModel.swift
//  MemorizeDIY
//
//  Created by Greg on 16.09.23.
//

import Foundation


struct MemorizeModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    
    init(_ pairsCount: Int, cardContentFactory: (Int) -> CardContent) {
        for index in 0..<pairsCount {
            let cardContent = cardContentFactory(index)
            cards.append(Card(isFaceUp: true, isMatched: false, content: cardContent, id: "\(index)a"))
            cards.append(Card(isFaceUp: true, isMatched: false, content: cardContent, id: "\(index)b"))
        }
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent

        var id: String
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
