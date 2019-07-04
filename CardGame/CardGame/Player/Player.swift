//
//  Player.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    var name: String { get }
    var cards: [Card] { get set }
    mutating func take(newCards: [Card])
    func determineWinningPokerHand() -> Decision
}

extension Player {
    mutating func take(newCards: [Card]) {
        self.cards.append(contentsOf: newCards)
    }
    
    func determineWinningPokerHand() -> Decision {
        return HandsDeterminator.determine(using: cards)
    }
}

