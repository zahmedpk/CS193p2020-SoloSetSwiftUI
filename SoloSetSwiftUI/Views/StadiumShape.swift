//
//  StadiumShape.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//

import AVFoundation
import SwiftUI

struct StadiumShape: Shape {
    func path(in rect: CGRect) -> Path {
        let rect = AVMakeRect(aspectRatio: ViewConstants.shapeAspectRatio, insideRect: rect)
        var path = Path()
        let radius: CGFloat = rect.height/2
        path.move(to: CGPoint(x: rect.origin.x + radius, y: rect.origin.y + 2 * radius))
        path.addArc(center: CGPoint(x: rect.origin.x + radius, y: rect.origin.y + radius), radius: radius,
                    startAngle: Angle.radians(Double.pi/2.0) , endAngle: Angle.radians(3 * Double.pi/2.0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.origin.x+rect.width-radius, y: rect.origin.y))
        path.addArc(center: CGPoint(x: rect.origin.x+rect.width-radius, y: rect.origin.y+radius), radius: radius,
                    startAngle: Angle.radians(3*Double.pi/2.0) , endAngle: Angle.radians(Double.pi/2.0), clockwise: false)
        path.closeSubpath()
        return path
    }
}
