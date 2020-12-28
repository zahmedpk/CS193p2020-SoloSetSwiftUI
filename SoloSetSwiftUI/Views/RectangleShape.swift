//
//  RectangleShape.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//
import AVFoundation
import SwiftUI

struct RectangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let rect = AVMakeRect(aspectRatio: ViewConstants.shapeAspectRatio, insideRect: rect)
        var path = Path()
        path.addRect(rect)
        return path
    }
}
