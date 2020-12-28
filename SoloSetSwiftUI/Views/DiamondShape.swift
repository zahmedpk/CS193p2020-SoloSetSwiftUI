//
//  DiamondShape.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//

import SwiftUI
import AVFoundation

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        let rect = AVMakeRect(aspectRatio: ViewConstants.shapeAspectRatio, insideRect: rect)
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape()
    }
}
