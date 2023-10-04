//
//  CardView.swift
//  MemorizeDIY
//
//  Created by Bob on 29.09.2023.
//

import SwiftUI



struct CardView: View {
    typealias Card = MemorizeModel<String>.Card
    
    let card: Card
    
    var body: some View {
        Pie(endAngle: Angle(degrees: 240))
            .overlay {
                Text(card.content)
                    .font(.custom("123", size: 100.0))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
            }
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .disabled(card.isMatched)
        .cardify(card.isFaceUp)
    }
}


#Preview {
    VStack {
        HStack{
            CardView(card: CardView.Card(isFaceUp: false, isMatched: false, content: "🐸", id: "#1"))
                .aspectRatio(4/3, contentMode: .fit)
            CardView(card: CardView.Card(isFaceUp: false, isMatched: false, content: "🐸", id: "#1"))
        }
        HStack{
            CardView(card: CardView.Card(isFaceUp: true, isMatched: false, content: "🐸", id: "#1"))
            CardView(card: CardView.Card(isFaceUp: false, isMatched: false, content: "🐸", id: "#1"))
        }
    }
            .padding()
        .foregroundStyle(.green)
}
