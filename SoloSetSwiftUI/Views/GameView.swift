//
//  GameView.swift
//  SoloSetSwiftUI
//
//  Created by Zubair Ahmed on 27/12/2020.
//  The top level View for the SET game

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            // Throw in some cards to test views
            CardView(card: Card(shape: .A, shading: .A, number: .Two, color: .A, id: 1))
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            CardView(card: Card(shape: .B, shading: .B, number: .One, color: .B, id: 2))
                .frame(width: 200, height: 200, alignment: .center)
            CardView(card: Card(shape: .C, shading: .C, number: .Three, color: .C, id: 3))
                .frame(width: 100, height: 100, alignment: .center)
            CardView(card: Card(shape: .A, shading: .A, number: .Two, color: .A, id: 4))
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
