//
//  ContentView.swift
//  MemorizeDIY
//
//  Created by Greg on 10.09.23.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var viewModel: MemorizeViewModel
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
            ScrollView{
                cards
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(viewModel.cards.indices, id: \.self) {
                index in CardView(
                    isFaceUp: viewModel.cards[index].isFaceUp,
                    face: viewModel.cards[index].content)
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool
    let face: String;
    
    var body: some View {
        ZStack {
            if !isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(height: 200)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 5)
                    .frame(height: 200)
                Text(face)
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            isFaceUp = !isFaceUp
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
