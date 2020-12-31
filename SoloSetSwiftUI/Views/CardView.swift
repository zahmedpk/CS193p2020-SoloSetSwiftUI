    //
    //  CardView.swift
    //  SoloSetSwiftUI
    //
    //  Created by Zubair Ahmed on 28/12/2020.
    //  Provide a View for Card
    import SwiftUI
    
    struct CardView: View, Identifiable, Hashable {
        let id: String
        // Draw a Card object
        // Card.Shape: .A is Diamond, .B is Rectangle, .C is Stadium
        // Card.Color: .A is Red, .B is Green, .C is Purple
        // Card.Shading .A is Outline, .B is Stripes(partially transparent), .C is fill
        let card: Card
        let color: Color
        let borderColor: Color
        let viewModel: SetGameViewModel
        let gameID: String
        init(card: Card, selectionStatus: SelectionStatus, viewModel: SetGameViewModel) {
            gameID = viewModel.gameID.uuidString
            id = "\(gameID)-\(card.id)"
            self.card = card
            self.viewModel = viewModel
            switch card.color {
            case .A:
                color = Color.red
            case .B:
                color = Color.green
            case .C:
                color = Color.purple
            }
            
            switch selectionStatus {
            case .None:
                borderColor = Color.gray
            case .Matched:
                borderColor = Color.green
            case .Mismatched:
                borderColor = Color.red
            case .Selected:
                borderColor = Color.blue
            }
        }
        var body: some View {
            GeometryReader {
                geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: geometry.size.width > 100 ? 10: 5)
                        .stroke(borderColor, lineWidth: 2.0)
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
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if borderColor != .green {//Ignore matched cards tap
                            withAnimation(Animation.easeOut(duration: ViewConstants.durationForMatchedCardsReplacement)) {
                                viewModel.replaceMatchingCards()
                            }
                            viewModel.choose(card)
                        }
                    }
                }
                .aspectRatio(ViewConstants.cardAspectRatio, contentMode: .fit)
                .padding(3)
            }
        }
        enum SelectionStatus {
            case Selected
            case Matched
            case Mismatched
            case None
        }
        static func == (lhs: CardView, rhs: CardView) -> Bool {
            return lhs.card == rhs.card && lhs.id == rhs.id &&
                lhs.gameID == rhs.gameID && lhs.borderColor == rhs.borderColor
        }
        func hash(into hasher: inout Hasher){
            hasher.combine(card.id)
            hasher.combine(gameID)
        }
    }
