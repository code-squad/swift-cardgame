//
//  PokerHands.swift
//  CardGame
//
//  Created by moon on 2018. 5. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PokerHands {
    
    enum Hand {
        case onePair(Card.Number)
        case twoPair(Card.Number)
        case triple(Card.Number)
        case fourCard(Card.Number)
        case highCard(Card.Number)
        
        var rank: Int {
            switch self {
            case .highCard:
                return 0
            case .onePair:
                return 1
            case .twoPair:
                return 2
            case .triple:
                return 3
            case .fourCard:
                return 4
            }
        }
    }
    
    private var cards: [Card]
    
    private let TRIPLE = 3
    private let FOURCARD = 4...7
    private let PAIR = 1
    
    init(_ cardsOfPlayer: [Card]) {
        self.cards = cardsOfPlayer
    }
    
    func generateHands() -> [Hand] {
        var hands: [Hand] = [Hand]()
        var pairCount = 0
        for number in Card.Number.allCases {
            var sameNumberCards = [Card]()
            for card in self.cards {
                if card.isSameNumber(number) {
                    sameNumberCards.append(card)
                }
            }
            
            switch sameNumberCards.count {
            case self.FOURCARD:
                hands.append(Hand.fourCard(number))
            case self.TRIPLE:
                hands.append(Hand.triple(number))
            case self.PAIR:
                pairCount += 1
                if pairCount != 1 {
                    hands.append(Hand.twoPair(number))
                } else {
                    hands.append(Hand.onePair(number))
                }
            default:
                continue
            }
        }
        return hands
    }
    
    func selectBestHand(_ hands: [Hand]) -> Hand {
        var bestHand: Hand
        if hands.count == 0 {
            bestHand = Hand.highCard(self.cards.highestCardNumber!)
        } else if hands.count == 1 {
            bestHand = hands.first!
        } else {
            bestHand = hands.max { leftCard, rightCard in leftCard.rank < rightCard.rank }!
        }
        return bestHand
    }
}

extension Array where Element == Card {
    var highestCardNumber: Card.Number? {
        guard let highestNumberCard = self.first else { return nil }
        var highestNumber: Card.Number = highestNumberCard.selectHigherNumber(highestNumberCard)
        for card in self {
            highestNumber = highestNumberCard.selectHigherNumber(card)
        }
        return highestNumber
    }
}
