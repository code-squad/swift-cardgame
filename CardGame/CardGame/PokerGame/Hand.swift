//
//  Hand.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Hand {
    private let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    var count: Int {
        return self.cards.count
    }
    
    var cardsInformation: [Card] {
        return self.cards
    }
}

extension Hand: CustomStringConvertible {
    var description: String {
        return self.cards.reduce(" -> ") { $0 + $1.description + " " }
    }
    
}
