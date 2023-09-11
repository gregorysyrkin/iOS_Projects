//
//  ContentView.swift
//  MemorizeDIY
//
//  Created by Greg on 10.09.23.
//

import SwiftUI

struct ContentView: View {
    enum Theme {
        case WINTER, HALLOWEEN, BALL_SPORTS
    }
    let WINTER_THEME_ITEMS = ["🤶","🎅","🛷","🥶","☃️","❄️","🥌","🏂", "🤶","🎅","🛷","🥶","☃️","❄️","🥌","🏂"]
    let HALLOWEEN_THEME_ITEMS = ["🎃","👻","💀","☎️","🎞️","⏱️","🔌","⚖️", "🎃","👻","💀","☎️","🎞️","⏱️","🔌","⚖️"]
    let BALL_SPORTS_THEME_ITEMS = ["🏀","🎱","🎾","🏈","🏐","⚽️","⚾️","🎈", "🏀","🎱","🎾","🏈","🏐","⚽️","⚾️","🎈"]
    @State var currentTheme: Theme = Theme.WINTER
    
    var currentThemeItems: [String] {
        switch currentTheme {
        case .WINTER:
            return WINTER_THEME_ITEMS.shuffled()
        case .HALLOWEEN:
            return HALLOWEEN_THEME_ITEMS.shuffled()
        case .BALL_SPORTS:
            return BALL_SPORTS_THEME_ITEMS.shuffled()
        }
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
            ScrollView{
                cards
            }
            Spacer()
            themeSelectorButtons
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<currentThemeItems.count, id: \.self) {
                index in CardView(face: currentThemeItems[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var themeSelectorButtons: some View {
        HStack {
            themeSelectorButton(themeValue: Theme.WINTER, label: "Winter", lookingLike: "snowflake.circle")
            themeSelectorButton(themeValue: Theme.HALLOWEEN, label: "Halloween", lookingLike: "fish")
            themeSelectorButton(themeValue: Theme.BALL_SPORTS, label: "Ball sports", lookingLike: "sportscourt")
        }
    }
    
    func themeSelectorButton(themeValue: Theme, label: String, lookingLike labelImageKey: String) -> some View {
        Button(action: {currentTheme = themeValue}) {
            VStack {
                Text(label).font(.body)
                Image(systemName: labelImageKey)
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
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
