//
//  Hand.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

class Hand: CustomStringConvertible {
    private var cards = [Card]()
    var description: String {
        return "\(cards)"
    }
    
    func add(card: Card) {
        self.cards.append(card)
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
    func makeHandRank() -> (HandRank, Int) {
        let countedHands = cards.reduce([Card.Ranks: Int](), { (countedHands: [Card.Ranks: Int], card: Card) -> [Card.Ranks: Int] in
            var countedHands = countedHands
            countedHands[card.rank] = (countedHands[card.rank] ?? 0) + 1
            return countedHands
        })
        
        let quadCards = countedHands.filter{ $0.value == 4 }
        for (key,value) in quadCards {
            if value == 4 {
                return (HandRank.quads,key.rawValue)
            }
        }
        
        let result = isStraight(cardCount: countedHands)
        if result.0 {
            return (HandRank.straight, result.1)
        }
        
        let tripleCards = countedHands.filter { $0.value == 3 }
        for (key,value) in tripleCards {
            if value == 3 {
                return (HandRank.triple, key.rawValue)
            }
        }
        
        var max = 0
        let anotherCards = countedHands.filter { $0.value == 2 }
        if anotherCards.count >= 2 {
            for (key,_) in anotherCards {
               max = max < key.rawValue ? key.rawValue : max
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
    
    
    private func isStraight(cardCount: [Card.Ranks : Int] ) -> (Bool, Int) {
        let cardSortValue = cardCount.sorted(by: { $0.0.rawValue < $1.0.rawValue })
        for index in stride(from: cardSortValue.count - 1, to: 0, by: -1) {
            let rank1 = cardSortValue[index].0.rawValue
            let rank2 = cardSortValue[index-1].0.rawValue
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
                return (true, maxRank)
            }
        }
        return (false, 0)
    }
}

