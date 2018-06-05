//
//  Player.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 6. 3..
//  Copyright © 2018년 JK. All rights reserved.
//

class Player: Playerable {
    
    private var sequenceNumber: Int
    private var cards: [Card] = []
    
    init(_ sequenceNumber: Int) {
        self.sequenceNumber = sequenceNumber
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func showMyCard() -> [Card] {
        return self.cards
    }
    
    func resetMyCard() {
        cards.removeAll()
    }
    
    func showPlayer(_ handler: (Playerable) -> Void) {
        print("\(CARDGAME.playerNames.player)\(sequenceNumber)", terminator: "")
        handler(self)
    }
}
