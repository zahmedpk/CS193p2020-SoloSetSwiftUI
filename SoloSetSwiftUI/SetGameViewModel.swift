//
//  ViewModel.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 28/12/2020.
//

import SwiftUI
import Combine

class SetGameViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    @Published var game: SetGame
    init() {
        game = SetGame()
        for _ in 1...4 {
            game.dealThreeCards()
        }
    }
    
    // MARK: access the model
    var cards: [Card] {
        game.dealtCards
    }
    
    // MARK: intents
    func dealMoreCards(){
        game.dealThreeCards()
        objectWillChange.send()
    }
}
