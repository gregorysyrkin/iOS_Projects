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
            return picturesBank[index]
    }
    
    //INTENTS
    
    func shuffle() {
        model.shuffle()
    }
    
    func handleCardClick(_ id: String) {
        model.handleCardClick(id)
    }
}
