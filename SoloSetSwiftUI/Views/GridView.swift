//
//  GridView.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//

import SwiftUI

struct GridView<GridItem>: View where GridItem: Identifiable,  GridItem: View, GridItem: Hashable {
    let items: [GridItem]
    let frameCalculator: GridLayout
    let viewModel: SetGameViewModel
    var body: some View {
        ForEach(items, id: \.id) {
            item in
            item
                .position(frameCalculator.location(ofItemAt: items.firstIndex(of: item)!))
                .frame(width: frameCalculator.itemSize.width, height: frameCalculator.itemSize.height, alignment: .top)
                .transition(.offset(randomOffset()))
        }
    }
    func randomOffset() -> CGSize {
        let radius = Double(max(UIScreen.screenWidth, UIScreen.screenHeight) + 200)
        let randomAngle = Double.random(in: 0...359)
        let xOffset = radius * cos(randomAngle)
        let yOffset = radius * sin(randomAngle)
        return CGSize(width: xOffset, height: yOffset)
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
