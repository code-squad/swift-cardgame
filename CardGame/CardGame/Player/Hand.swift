//
//  Hand.swift
//  CardGame
//
//  Created by JieunKim on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

typealias  Hands = [Card: HandRank]
class Hand: CustomStringConvertible {
    private var cards = [Card]()
    private var collectionCards = [Card: Int]()
    private var hands = [Card: HandRank]()
    
    var description: String {
        return "\(cards)"
    }
    
    func add(card: Card) {
        self.cards.append(card)
    }
    
    func clear() {
        self.cards.removeAll()
    }
    
    // card의 count를 dic로 print
    private func makeHands() {
        self.collectionCards = cards.reduce(into: [:]) { counts, card in counts[card, default: 0] += 1 }
        self.hands = HandDecisionMaker.decideGeneralHand(collected: collectionCards)
        
        decideSpecificHands()
    }
    
    private func decideSpecificHands() {
        self.hands = HandDecisionMaker.decideTwoPair(generalHands: hands)
        let straight = HandDecisionMaker.decideStraight(collected: collectionCards)
        if straight.isStraight, let max = straight.maxRank {
            hands[max] = .straight
        }
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
        
        let maxHand = sortedHands[sortedHands.count - 1]
        return maxHand
    }
}

extension Hand: Comparable {
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.bestHand().value == rhs.bestHand().value {
            return lhs.bestHand().key < rhs.bestHand().key
        }
        return lhs.bestHand().value < rhs.bestHand().value
    }
    
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.bestHand() == rhs.bestHand()
    }
}
