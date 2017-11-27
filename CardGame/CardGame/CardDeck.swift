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
        return  cardDeck.removeLast()
    }

    // 처음처럼 모든 카드를 다시 채워넣는다.
    mutating func reset() {
        cardDeck = fullCardDeck
    }

    // 카드덱 세팅
    mutating private func setCardDeck() {
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

}
