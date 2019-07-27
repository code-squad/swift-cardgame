//
//  Hand.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

class Hand: CustomStringConvertible {
    private var cards = [Card]()
    private var collectionCards = [Card: Int]()
    
    var description: String {
        return "\(cards)"
    }
    
    func add(card: Card) {
        self.cards.append(card)
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
    func isStraight() -> (Bool,Int) {
        let cardCount = cards.reduce([Card.Ranks: Int](), { (cardCount: [Card.Ranks: Int], card: Card) -> [Card.Ranks: Int] in
            var cardCount = cardCount
            cardCount[card.rank] = (cardCount[card.rank] ?? 0) + 1
            return cardCount
        })
        let cardSortValue = cardCount.sorted(by: { $0.0 < $1.0 })
        for index in 0...cardSortValue.count {
            let reversedIndex = cardSortValue.count-index
            let rank1 = cardSortValue[reversedIndex].0.rawValue
            let rank2 = cardSortValue[reversedIndex-1].0.rawValue
            var maxRank = 0
            var count = 0
            
            if rank1-1 == rank2 {
                if count == 0 {
                    maxRank = rank1
                }
                count = count + 1
            } else {
                maxRank = 0
                count = 0
            }
            
            if count >= 4 {
                return (true,maxRank)
            }
        }
        return (false,0)
    }
    
    func makeHandRank() -> (HandRank,Int) {
        let cardCount = cards.reduce([Card.Ranks: Int](), { (cardCount: [Card.Ranks: Int], card: Card) -> [Card.Ranks: Int] in
            var cardCount = cardCount
            cardCount[card.rank] = (cardCount[card.rank] ?? 0) + 1
            return cardCount
        })
        
        let quadCards = cardCount.filter{ $0.value == 4 }
        for (key,value) in quadCards {
            if value == 4 {
                return (HandRank.quads,key.rawValue)
            }
        }
        
        let result = isStraight()
        if result.0 {
            return (HandRank.straight, result.1)
        }
        
        let tripleCards = cardCount.filter{ $0.value == 3 }
        for (key,value) in tripleCards {
            if value == 3 {
                return (HandRank.triple, key.rawValue)
            }
        }
        
        var max = 0
        let anotherCards = cardCount.filter { $0.value == 2 }
        
        if anotherCards.count >= 2 {
            for (key,value) in anotherCards {
                if value == 2 {
                    if max < key.rawValue {
                        max = key.rawValue
                    }
                }
            }
            return (HandRank.twoPair, max)
        }
        
        if anotherCards.count == 1 {
            for (key,value) in anotherCards {
                if value == 2 {
                    return (HandRank.onePair, key.rawValue)
                }
            }
        }
        return (HandRank.highcard,0)
    }
}

