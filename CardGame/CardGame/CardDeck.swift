//
//  CardDeck.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct CardDeck {
    private var fullCardDeck: Array<Card> = []
    private var cardDeck: Array<Card> = []

    init() {
        setCardDeck()
    }

    // 갖고 있는 카드 개수를 반환한다.
    func count() -> Int {
        return cardDeck.count
    }

    // 전체 카드를 랜덤하게 섞는다.
    mutating func shuffle() {
        for i in stride(from: cardDeck.count - 1, through: 1, by: -1) {
            let j = Int(arc4random_uniform(UInt32(i+1)))
            if i != j {
                self.cardDeck.swapAt(i, j)
            }
        }
    }

    // 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    mutating func removeOne() -> Card {
        return cardDeck.removeLast()
    }

    // 처음처럼 모든 카드를 다시 채워넣는다.
    mutating func reset() {
        cardDeck = fullCardDeck
    }

    // 카드덱 세팅
    mutating private func setCardDeck() {
        fullCardDeck.append(Card.init(suit: .spades, rank: .ace))
        fullCardDeck.append(Card.init(suit: .spades, rank: .two))
        fullCardDeck.append(Card.init(suit: .spades, rank: .three))
        fullCardDeck.append(Card.init(suit: .spades, rank: .four))
        fullCardDeck.append(Card.init(suit: .spades, rank: .five))
        fullCardDeck.append(Card.init(suit: .spades, rank: .six))
        fullCardDeck.append(Card.init(suit: .spades, rank: .seven))
        fullCardDeck.append(Card.init(suit: .spades, rank: .eight))
        fullCardDeck.append(Card.init(suit: .spades, rank: .nine))
        fullCardDeck.append(Card.init(suit: .spades, rank: .ten))
        fullCardDeck.append(Card.init(suit: .spades, rank: .jack))
        fullCardDeck.append(Card.init(suit: .spades, rank: .queen))
        fullCardDeck.append(Card.init(suit: .spades, rank: .king))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .ace))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .two))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .three))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .four))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .five))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .six))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .seven))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .eight))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .nine))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .ten))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .jack))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .queen))
        fullCardDeck.append(Card.init(suit: .hearts, rank: .king))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .ace))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .two))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .three))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .four))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .five))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .six))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .seven))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .eight))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .nine))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .ten))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .jack))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .queen))
        fullCardDeck.append(Card.init(suit: .diamonds, rank: .king))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .ace))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .two))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .three))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .four))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .five))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .six))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .seven))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .eight))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .nine))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .ten))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .jack))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .queen))
        fullCardDeck.append(Card.init(suit: .clubs, rank: .king))
        cardDeck = fullCardDeck
    }

    subscript(index: Int) -> Card {
        return cardDeck[index]
    }

}
