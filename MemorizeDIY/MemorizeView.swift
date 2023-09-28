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
    
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.title)
            Text("Score: \(viewModel.memorizeModel.score)")
            ScrollView {
                cards
                    .animation(.default, value: viewModel.memorizeModel.cards)
                
            }
            Spacer()
            
            Button("New Game") {
                viewModel.startNewGame()
            }
        }
        .padding()
        .onChange(of: viewModel.memorizeModel.isGameOver, perform: { newValue in if newValue { isGameOverCounter += 1 } })
        .confettiCannon(counter: $isGameOverCounter)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(viewModel.memorizeModel.cards) {
                card in CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.handleCardClick(card.id)
                    }
                    .opacity(card.isMatched ? 0 : 1)
            }
        }
    }
}

struct CardView: View {
    let card: MemorizeModel<String>.Card
    
    var body: some View {
        ZStack {
            if !card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(MemorizeViewModel.themeModel.activeTheme.primaryColor)
                    .frame(height: 200)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(MemorizeViewModel.themeModel.activeTheme.primaryColor, lineWidth: 5)
                    .frame(height: 200)
                Text(card.content)
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .disabled(card.isMatched)
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
