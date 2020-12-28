//
//  ShapeView.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//  Draws a rectangle, diamond or capsule
import SwiftUI

struct ShapeView: Shape {
    let shape: Card.Shape
    func path(in rect: CGRect) -> Path {
        var p: Path
        switch shape {
        case .A:
            p = DiamondShape().path(in: rect)
        case .B:
            p = RectangleShape().path(in: rect)
        case .C:
            p = Capsule().path(in: rect)
        }
        return p
    }
}
