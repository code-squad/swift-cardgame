//
//  Player.swift
//  CardGame
//
//  Created by jang gukjin on 21/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var cards: [Card] { get }
    func getName() -> String
}

extension Player {
    mutating func playerToPrint() -> String {
        var playerAndCards: String = self.getName()+" ["
        for card in cards {
            playerAndCards += card.cardToPrint()+","
        }
        playerAndCards.removeLast()
        playerAndCards += "]"
        return playerAndCards
    }
}
