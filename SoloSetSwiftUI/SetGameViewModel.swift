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
    func selectionStatus(of card: Card) -> CardView.SelectionStatus {
        let isSelected = game.selectedCards.contains(card)
        var selectionStatus: CardView.SelectionStatus
        if isSelected {
            selectionStatus = .Selected
            if game.selectedCards.count == 3 {
                if game.selectedCardsFormASet {
                    selectionStatus = .Matched
                } else {
                    selectionStatus = .Mismatched
                }
            }
        } else {
            selectionStatus = .None
        }
        return selectionStatus
    }
    var numberOfCardsInDeck: Int {
        game.deck.count
    }
    var score: Int {
        game.score
    }
    
    // MARK: intents
    func dealMoreCards(){
        if game.selectedCardsFormASet {
            game.replaceSelectedCards()
        } else {
            game.dealThreeCards()
        }
        objectWillChange.send()
    }
    func choose(_ card: Card){
        game.select(card: card)
        objectWillChange.send()
    }
    func startNewGame(){
        game = SetGame()
        for _ in 1...4 {
            game.dealThreeCards()
        }
        objectWillChange.send()
    }
}
