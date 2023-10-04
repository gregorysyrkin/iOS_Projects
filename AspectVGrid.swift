//
//  AspectVGrid.swift
//  MemorizeDIY
//
//  Created by Bob on 29.09.2023.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: Array<Item>
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    var body: some View {
        GeometryReader(content: { geometry in
            let gridSizeItem = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                aspectRatio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridSizeItem), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                  content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }})
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
