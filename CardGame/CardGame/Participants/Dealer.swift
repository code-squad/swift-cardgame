//
//  Dealer.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class Dealer : PokerPlayable {
    private(set) var ownCards: OwnCards!
    private(set) var cardDeck: CardDeck!
    var name: String!
    
    
    init(name : String, cardDeck: CardDeck) {
        self.name = name
        self.cardDeck = cardDeck
        ownCards = OwnCards()
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
    
    func shuffleCardDeck() {
        self.cardDeck.shuffle()
    }
    
    func giveCard(to player: PokerPlayable) {
        player.addCard(card: cardDeck.removeOne())
    }
    
    
}
