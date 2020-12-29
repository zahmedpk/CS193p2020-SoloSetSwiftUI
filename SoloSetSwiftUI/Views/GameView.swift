//
//  GameView.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 27/12/2020.
//  The top level View for the SET game

import SwiftUI

struct GameView: View {
    @ObservedObject var setGameViewModel: SetGameViewModel
    var body: some View {
        Group {
            GeometryReader {
                geometry in
                GridView(
                    items: setGameViewModel.cards.map {cardView(for: $0)},
                    frameCalculator: GridLayout(itemCount: setGameViewModel.cards.count, nearAspectRatio: Double(ViewConstants.cardAspectRatio), in: geometry.size),
                    viewModel: setGameViewModel
                )
            }
        }
        .padding(3)
        
        Button("Deal More Cards", action: {
            setGameViewModel.dealMoreCards()
        })
    }
    func cardView(for card: Card) -> CardView {
        let cv = CardView(card: card, selectionStatus: setGameViewModel.selectionStatus(of: card), viewModel: setGameViewModel)
        return cv
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(setGameViewModel: SetGameViewModel())
    }
}
