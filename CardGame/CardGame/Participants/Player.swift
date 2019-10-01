//
//  Player.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player : PokerPlayable {
    private(set) var ownCards: OwnCards!
    private(set) var name: String!
    
    
    init(name : String) {
        self.name = name
        self.ownCards = OwnCards()
    }
    
    deinit {
        giveBackCardAll()
    }
    
    func addCard(card: Card) {
        self.ownCards.add(card: card)
    }
    
    func myOwnCard() -> OwnCards {
        return self.ownCards
    }
    
    func giveBackCardAll() {
        self.ownCards.giveBackAll()
    }
    
    func hands() throws -> PokerHandRankings {
        return try self.ownCards.calculateHands()
    }
}
