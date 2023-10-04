//
//  Cardify.swift
//  MemorizeDIY
//
//  Created by Bob on 29.09.2023.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if !isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(MemorizeViewModel.themeModel.activeTheme.primaryColor)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(MemorizeViewModel.themeModel.activeTheme.primaryColor, lineWidth: 5)
                content
            }
        }
    }
}

extension View {
    func cardify(_ isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
