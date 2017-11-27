//
//  CardDeck.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct CardDeck {
    private var fullCardDeck: Array<Card> = []
    private var cardDeck: Array<Card> = []

    init() {
        setNewFullCardDeck()
    }

    // return current cards count
    func count() -> Int {
        return cardDeck.count
    }

    // shuffle current cards
    mutating func shuffle() {
        for i in stride(from: cardDeck.count - 1, through: 1, by: -1) {
            let j = Int(arc4random_uniform(UInt32(i+1)))
            if i != j {
                self.cardDeck.swapAt(i, j)
            }
        }
    }

    // return last card & remove from current deck
    mutating func removeOne() -> Card {
        return  cardDeck.removeLast()
    }

    // reset current card deck as new full card deck
    mutating func reset() {
        cardDeck = fullCardDeck
    }

    // set new full card deck
    mutating private func setNewFullCardDeck() {
        for rank in Card.Rank.allCases {
            fullCardDeck.append(Card.init(suit: .spades, rank: rank))
            fullCardDeck.append(Card.init(suit: .hearts, rank: rank))
            fullCardDeck.append(Card.init(suit: .diamonds, rank: rank))
            fullCardDeck.append(Card.init(suit: .clubs, rank: rank))
        }
        cardDeck = fullCardDeck
    }

    subscript(index: Int) -> Card {
        return cardDeck[index]
    }

    // return a pack of cards as many as player wants
    mutating func getCardPack(count: Int) -> Array<Card> {
        var cardPack: Array<Card> = []
        for _ in 0..<count {
            cardPack.append(removeOne())
        }
        return cardPack
    }

}
