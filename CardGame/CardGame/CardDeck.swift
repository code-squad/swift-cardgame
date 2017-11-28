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

    enum Dealer: String, Error {
        case noCard = "카드가 모두 소진됐습니다."
        case notEnoughCard = "더이상 카드가 모두에게 돌아갈 수 없습니다."
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
            throw Dealer.noCard
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

    // return a pack of cards
    private mutating func getCardPack(count: Int) throws -> CardPack {
        var cardPack: CardPack = []
        for _ in 0..<count {
            do {
                cardPack.append(try removeOne())
            } catch {
                throw Dealer.noCard
            }
        }
        return cardPack
    }

    // return packs of cards as many as player wants
    mutating func getCardPacks(packCount: Int) throws -> Array<CardPack> {
        var cardPacks: Array<CardPack> = []
        for i in 1...packCount {
            do {
                cardPacks.append(try getCardPack(count: i))
            } catch {
                throw Dealer.noCard
            }
        }
        return cardPacks
    }

    func makePokerStuds(playerCount: Int) -> Array<CardPack> {
        var pokerStud: Array<CardPack> = []
        for _ in 1...playerCount {
            pokerStud.append([])
        }
        return pokerStud
    }

    mutating func getNewCard(pokerStud: inout Array<CardPack>) throws {
        guard pokerStud.count < cardDeck.count else {
            throw Dealer.notEnoughCard
        }
        for i in 0..<pokerStud.count {
            pokerStud[i].append(try removeOne())
        }
    }
    
}
