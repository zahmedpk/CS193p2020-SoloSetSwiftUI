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
        ForEach(items, id: \.self) {
            item in
            item
                .position(frameCalculator.location(ofItemAt: items.firstIndex(of: item)!))
                .frame(width: frameCalculator.itemSize.width, height: frameCalculator.itemSize.height, alignment: .top)
        }
    }
}
