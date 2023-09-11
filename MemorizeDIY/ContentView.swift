//
//  ContentView.swift
//  MemorizeDIY
//
//  Created by Greg on 10.09.23.
//

import SwiftUI

struct ContentView: View {
    let deck = ["🏀","🎱","🎾","🏈","🏐","⚽️","⚾️","🎈"]
    var currentNumberOfCards = 4
    var body: some View {
        VStack {
            HStack{
                ForEach(0..<currentNumberOfCards) { index in CardView(isFaceUp: true, face: deck[index])
                    
                }
                
                CardView(face: deck[0])
//                CardView()
//                CardView()
//                CardView()
            }
            Spacer()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = true
    
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
