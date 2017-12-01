//
//  CardDeck.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

typealias CardPack = Array<Card>

struct CardDeck {
    private var fullCardDeck: CardPack = []
    private var cardDeck: CardPack = []

    enum CardDeckStatus: String, Error {
        case noCard = "카드가 모두 소진됐습니다."
    }

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
    mutating func removeOne() throws -> Card {
        guard cardDeck.count > 0 else {
            throw CardDeckStatus.noCard
        }
        return  cardDeck.removeLast()
    }

    // reset current card deck as new full card deck
    mutating func reset() {
        cardDeck = fullCardDeck
    }

    // set new full card deck
    mutating private func setNewFullCardDeck() {
        for rank in Card.Rank.allCases {
            fullCardDeck.append(Card.init(suit: .spades, rank: rank, upside: false))
            fullCardDeck.append(Card.init(suit: .hearts, rank: rank, upside: false))
            fullCardDeck.append(Card.init(suit: .diamonds, rank: rank, upside: false))
            fullCardDeck.append(Card.init(suit: .clubs, rank: rank, upside: false))
        }
        cardDeck = fullCardDeck
    }

    subscript(index: Int) -> Card {
        return cardDeck[index]
    }

    // return a pack of cards
    private mutating func getCardPack(count: Int) throws -> CardPack {
        var cardPack: CardPack = []
        for _ in 0..<count {
            cardPack.append(try removeOne())
        }
        return cardPack
    }

    // return packs of cards as many as player wants
    mutating func getCardPacks(packCount: Int) throws -> Array<CardPack> {
        var cardPacks: Array<CardPack> = []
        for i in 1...packCount {
            cardPacks.append(try getCardPack(count: i))
        }
        return cardPacks
    }

}
