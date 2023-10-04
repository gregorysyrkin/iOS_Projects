//
//  Pie.swift
//  MemorizeDIY
//
//  Created by Bob on 29.09.2023.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    let startAngle = Angle(degrees: 0)
    let endAngle: Angle
    let clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width / 2, rect.height / 2)
        let startAngle = startAngle - Angle(degrees: 90)
        let endAngle = endAngle - Angle(degrees: 90)
        let startPoint = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: startPoint)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        p.addLine(to: center)
        return p
    }
}
