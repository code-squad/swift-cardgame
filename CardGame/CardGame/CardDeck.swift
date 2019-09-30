//
//  CardDeck.swift
//  CardGame
//
//  Created by 공명진 on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Shuffle
extension Array {
    public func shuffle() -> Array {
        var list = self
        for i in stride(from: list.count - 1, to: 1, by: -1) {
            let j = Int.random(in: 0...i)
            if i != j {
                list.swapAt(i, j)
            }
        }
        return list
    }
}

class CardDeck {
    
    private var cards = [Card]()
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func allCards() -> [Card] {
        return cards
    }

    func reset() {
        /* 생성시에는 아래의 모양으로 값이 주어진다.
         [
             Card(spades,ace), ... , Card(spades, king),
             Card(hearts, ace), ... , Card(hearts, king),
             Card(diamonds, ace), ... , Card(diamonds, king),
             Card(clubs, ace), ... , Card(clubs, king)
         ]
         */
        cards.removeAll()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func shuffle() {
        cards = cards.shuffle()
    }
    
    func removeOne() -> Card? {
        guard let card = cards.first else { return nil }
        
        cards.removeFirst()
        return card
    }
    
}
