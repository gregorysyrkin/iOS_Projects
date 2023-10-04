//
//  ContentView.swift
//  MemorizeDIY
//
//  Created by Greg on 10.09.23.
//

import SwiftUI
import ConfettiSwiftUI

struct MemorizeView: View {
    @ObservedObject var viewModel: MemorizeViewModel
    
    @State var isGameOverCounter = 0
    let aspectRatio: CGFloat = 2/3
    let spacing: CGFloat = 4
    
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.title)
            Text("Score: \(viewModel.memorizeModel.score)")
            
            cards
                .foregroundStyle(.orange)
                .animation(.default, value: viewModel.memorizeModel.cards)
            
            Button("New Game") {
                viewModel.startNewGame()
            }
        }
        .padding()
        .onChange(of: viewModel.memorizeModel.isGameOver, perform: { newValue in if newValue { isGameOverCounter += 1 } })
        .confettiCannon(counter: $isGameOverCounter)
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.memorizeModel.cards, aspectRatio: aspectRatio) {
            card in CardView(card: card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.handleCardClick(card.id)
                }
                .opacity(card.isMatched ? 0 : 1)
        }
    }
}






///
///
///
struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView(viewModel: MemorizeViewModel())
    }
}
