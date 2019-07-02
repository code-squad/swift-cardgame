//
//  Player.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Player {
    static var typeDescription: String { get }
    var cards: [Card] { get set }
    mutating func take(newCards: [Card])
}

extension Player {
    mutating func take(newCards: [Card]) {
        self.cards.append(contentsOf: newCards)
    }
}

