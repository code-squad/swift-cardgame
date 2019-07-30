//
//  Dealer.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer: Player, Dealable {
    private var cardDeck: CardDeck
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
        super.init(name: "딜러")
    }
    
    func give() -> Card? {
        return cardDeck.removeOne()
    }
 }
