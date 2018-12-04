//
//  Deck.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 4..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Deck : CardGameDeck {
    private var cards : [Card] = [Card.init(suit: .clubs, number: .A),
                                  Card.init(suit: .clubs, number: .two),
                                  Card.init(suit: .clubs, number: .three),
                                  Card.init(suit: .clubs, number: .four),
                                  Card.init(suit: .clubs, number: .five),
                                  Card.init(suit: .clubs, number: .six),
                                  Card.init(suit: .clubs, number: .seven),
                                  Card.init(suit: .clubs, number: .eight),
                                  Card.init(suit: .clubs, number: .nine),
                                  Card.init(suit: .clubs, number: .ten),
                                  Card.init(suit: .clubs, number: .J),
                                  Card.init(suit: .clubs, number: .Q),
                                  Card.init(suit: .clubs, number: .K),     //clubs
        Card.init(suit: .hearts, number: .A),
        Card.init(suit: .hearts, number: .two),
        Card.init(suit: .hearts, number: .three),
        Card.init(suit: .hearts, number: .four),
        Card.init(suit: .hearts, number: .five),
        Card.init(suit: .hearts, number: .six),
        Card.init(suit: .hearts, number: .seven),
        Card.init(suit: .hearts, number: .eight),
        Card.init(suit: .hearts, number: .nine),
        Card.init(suit: .hearts, number: .ten),
        Card.init(suit: .hearts, number: .J),
        Card.init(suit: .hearts, number: .Q),
        Card.init(suit: .hearts, number: .K),     //hearts
                        Card.init(suit: .diamonds, number: .A),
                        Card.init(suit: .diamonds, number: .two),
                        Card.init(suit: .diamonds, number: .three),
                        Card.init(suit: .diamonds, number: .four),
                        Card.init(suit: .diamonds, number: .five),
                        Card.init(suit: .diamonds, number: .six),
                        Card.init(suit: .diamonds, number: .seven),
                        Card.init(suit: .diamonds, number: .eight),
                        Card.init(suit: .diamonds, number: .nine),
                        Card.init(suit: .diamonds, number: .ten),
                        Card.init(suit: .diamonds, number: .J),
                        Card.init(suit: .diamonds, number: .Q),
                        Card.init(suit: .diamonds, number: .K),   //diamonds
                                        Card.init(suit: .spades, number: .A),
                                        Card.init(suit: .spades, number: .two),
                                        Card.init(suit: .spades, number: .three),
                                        Card.init(suit: .spades, number: .four),
                                        Card.init(suit: .spades, number: .five),
                                        Card.init(suit: .spades, number: .six),
                                        Card.init(suit: .spades, number: .seven),
                                        Card.init(suit: .spades, number: .eight),
                                        Card.init(suit: .spades, number: .nine),
                                        Card.init(suit: .spades, number: .ten),
                                        Card.init(suit: .spades, number: .J),
                                        Card.init(suit: .spades, number: .Q),
                                        Card.init(suit: .spades, number: .K)]   //spades
    
    func count() -> Int {
        return cards.count
    }
}
