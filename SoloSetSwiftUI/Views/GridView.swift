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
    var body: some View {
//        ForEach(0..<items.count){
//            index in
//            items[index]
//                .position(frameCalculator.location(ofItemAt: index))
//                .frame(width: frameCalculator.itemSize.width, height: frameCalculator.itemSize.height, alignment: .top)
//                .onTapGesture {
//                    // TODO: remove it
//                    print("card \(items[index]) was tapped")
//                }
//        }
        ForEach(items, id: \.self) {
            item in
            item
                .position(frameCalculator.location(ofItemAt: items.firstIndex(of: item)!))
                .frame(width: frameCalculator.itemSize.width, height: frameCalculator.itemSize.height, alignment: .top)
        }
    }
}

//struct CardsGridView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
