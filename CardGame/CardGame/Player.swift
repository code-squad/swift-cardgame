//
//  Player.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Player: CustomStringConvertible {
    private let name: String
    private var cards: CardPack = []
    private var top: Card?
    private var pokerHand: PokerShowDown.PokerHands

    init(name: String) {
        self.name = name
        pokerHand = .none
    }

    func callNewCard(_ card: Card) {
        cards.append(card)
        cards.sort()
    }

    func openCards() {
        var pokerShowDown: PokerShowDown = PokerShowDown(cards: cards)
        let result = pokerShowDown.openCards()
        pokerHand = result.pokerHand
        top = result.top
    }

    var description: String {
        return "\(name) : \(cards)"
    }

}

typealias Winner = Player

extension Winner: Comparable {

    static func <(lhs: Winner, rhs: Winner) -> Bool {
        if lhs.pokerHand < rhs.pokerHand {
            return true
        } else if lhs.pokerHand == rhs.pokerHand && lhs.top! < rhs.top! {
            return true
        } else {
            return false
        }
    }

    static func ==(lhs: Winner, rhs: Winner) -> Bool {
        return lhs.name == rhs.name
    }

    var winnerDescription: String {
        return "\(name) -> \(pokerHand), top: \(top!)"
    }

}
