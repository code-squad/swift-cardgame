//
//  MyDealer.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MyDealer: MyPlayer, Dealer {
    typealias P = MyPlayer
    
    private var deck: CardDeck = CardDeck()
    
    override init(name: String = "\t딜러", hand: CardHand = CardHand() ) {
        super.init(name: name,hand: hand)
    }
    
    func draw() throws -> Card {
        let delay = { Thread.sleep(forTimeInterval: .init(floatLiteral: 0.15)) }
        delay()
        guard let card = self.deck.removeOne() else {
            throw GameException.emptyDeck
        }
        return card
    }
    
    func canContinue(needs: Int) -> Bool {
        return needs < deck.count()
    }
    
}
