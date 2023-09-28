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
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.title)
            Text("Score: \(viewModel.memorizeModel.score)")
            cards.animation(.default, value: viewModel.memorizeModel.cards)
            Button("New Game") {
                viewModel.startNewGame()
            }
        }
        .padding()
        .onChange(of: viewModel.memorizeModel.isGameOver, perform: { newValue in if newValue { isGameOverCounter += 1 } })
        .confettiCannon(counter: $isGameOverCounter)
    }
    
    var cards: some View {
        GeometryReader(content: { geometry in
            let gridSizeItem = gridItemWidthThatFits(
                count: viewModel.memorizeModel.cards.count,
                size: geometry.size,
                aspectRatio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridSizeItem), spacing: 0)], spacing: 0) {
                ForEach(viewModel.memorizeModel.cards) {
                    card in CardView(card: card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.handleCardClick(card.id)
                        }
                        .opacity(card.isMatched ? 0 : 1)
                }
            }
        })
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        
        repeat {
            let cardWidth = size.width / columnCount
            let cardHeight = cardWidth / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if cardHeight * rowCount < size.height {
                return cardWidth.rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

struct CardView: View {
    let card: MemorizeModel<String>.Card
    
    var body: some View {
        ZStack {
            if !card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(MemorizeViewModel.themeModel.activeTheme.primaryColor)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(MemorizeViewModel.themeModel.activeTheme.primaryColor, lineWidth: 5)
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
