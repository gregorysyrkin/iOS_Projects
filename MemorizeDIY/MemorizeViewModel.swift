//
//  MemorizeViewModel.swift
//  MemorizeDIY
//
//  Created by Greg on 16.09.23.
//

import Foundation


class MemorizeViewModel: ObservableObject {
    static let picturesBank = ["🤶","🎅","🛷","🥶","⚙️"]
    @Published var model = MemorizeModel(5) {
        index in
            return Card(isFaceUp: true, content: picturesBank[index])
    }
    
    var cards: [Card<String>] {
        model.cards
    }
    
    //INTENTS
    
    func shuffle() {
        model.shuffle()
    }
}
