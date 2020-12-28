    //
    //  CardView.swift
    //  SoloSetSwiftUI
    //
    //  Created by Zubair Ahmed on 28/12/2020.
    //  Provide a View for Card
    import SwiftUI
    
    struct CardView: View, Identifiable, Hashable {
        var id: Int {
            return card.id
        }
        
        // Draw a Card object
        // Card.Shape: .A is Diamond, .B is Rectangle, .C is Stadium
        // Card.Color: .A is Red, .B is Green, .C is Purple
        // Card.Shading .A is Outline, .B is Stripes(partially transparent), .C is fill
        let card: Card
        let color: Color
        init(card: Card) {
            self.card = card
            switch card.color {
            case .A:
                color = Color.red
            case .B:
                color = Color.green
            case .C:
                color = Color.purple
            }
        }
        var body: some View {
            GeometryReader {
                geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: geometry.size.width > 100 ? 10: 5)
                        .stroke(Color.gray)
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                        ForEach(0..<card.number.rawValue){_ in
                            Group {
                                switch card.shading {
                                case .A://outline
                                    ShapeView(shape: card.shape)
                                        .stroke(color)
                                case .B://stripes
                                    ShapeView(shape: card.shape)
                                        .fill(color)
                                        .opacity(0.25)
                                case .C://fill
                                    ShapeView(shape: card.shape)
                                        .fill(color)
                                }
                            }.padding(3)
                        }
                    })
                    .padding(geometry.size.width > 100 ? 10: 5)
                }.aspectRatio(ViewConstants.cardAspectRatio, contentMode: .fit)
                .padding(3)
            }
        }
    }
    
