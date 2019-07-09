//
//  Cards.swift
//  CardGame
//
//  Created by Daheen Lee on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Cards {
    var list: [Card]
    
    init() {
        self.list = [Card]()
    }
    
    init(_ cardList: [Card]) {
        self.list = cardList
    }
    
    func add(newCard: Card) {
        self.list.append(newCard)
    }
    
    func add(newCards: Cards) {
        self.list.append(contentsOf: newCards.list)
    }
    
    func determineWinningDecision() -> Decision {
        return HandsDeterminator.determine(using: self.list)
    }
}

extension Cards: CustomStringConvertible {
    var description: String {
        return "\(self.list)"
    }
}

extension Cards: Equatable, Comparable {
    static func == (lhs: Cards, rhs: Cards) -> Bool {
        let leftDecision = HandsDeterminator.determine(using: lhs.list)
        let rightDecision = HandsDeterminator.determine(using: rhs.list)
        return leftDecision == rightDecision
    }
    
    static func < (lhs: Cards, rhs: Cards) -> Bool {
        let leftDecision = HandsDeterminator.determine(using: lhs.list)
        let rightDecision = HandsDeterminator.determine(using: rhs.list)
        return leftDecision < rightDecision
    }
}
