//
//  Player.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var cards: CardSet { get }
    func getName() -> String
}

extension Player {
    mutating func playerToPrint() -> String {
        var playerAndCards: String = self.getName()+" ["
        let deck = cards.getDeck()
        for card in deck {
            playerAndCards += card.cardToPrint()+","
        }
        playerAndCards.removeLast()
        playerAndCards += "]"
        return playerAndCards
    }
    
}

func < (lhs: Player, rhs: Player) -> Bool {
    return lhs.cards.totalScore() < rhs.cards.totalScore()
}
