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
            cards.append(Card(isFaceUp: false, isMatched: false, content: cardContent, id: "\(index)a"))
            cards.append(Card(isFaceUp: false, isMatched: false, content: cardContent, id: "\(index)b"))
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
    
    var theOneAndOnlyFaceUpCardIndex: Int? {
        get { cards.indices.filter() { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach() { index in cards[index].isFaceUp = index == newValue } }
    }
    
    mutating func handleCardClick(_ id: String) {
        if let clickedIndex = cards.firstIndex(where: {$0.id == id}) {
            if !cards[clickedIndex].isFaceUp && !cards[clickedIndex].isMatched {
                if let potentialMatchIndex = theOneAndOnlyFaceUpCardIndex {
                    if cards[potentialMatchIndex].content == cards[clickedIndex].content {
                        cards[potentialMatchIndex].isMatched = true
                        cards[clickedIndex].isMatched = true
                    }
                }
                else {
                    theOneAndOnlyFaceUpCardIndex = clickedIndex
                }
                cards[clickedIndex].isFaceUp = true
            }
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
