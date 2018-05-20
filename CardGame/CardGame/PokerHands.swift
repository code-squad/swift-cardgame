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
        
        var cardNumber: Card.Number {
            switch self {
            case .highCard(let cardNumber):
                return cardNumber
            case .onePair(let cardNumber):
                return cardNumber
            case .twoPair(let cardNumber):
                return cardNumber
            case .triple(let cardNumber):
                return cardNumber
            case .fourCard(let cardNumber):
                return cardNumber
            }
        }
    }
    
    private var cards: [Card]
    
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
            case 4...7:
                hands.append(Hand.fourCard(number))
            case 3:
                hands.append(Hand.triple(number))
            case 2:
                if pairCount == 0 {
                    hands.append(Hand.onePair(number))
                    pairCount += 1
                } else {
                    hands.append(Hand.twoPair(number))
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

extension PokerHands.Hand: Equatable {
    static func == (lhs: PokerHands.Hand, rhs: PokerHands.Hand) -> Bool {
        return lhs.rank == rhs.rank
    }
}

extension PokerHands.Hand: Comparable {
    static func < (lhs: PokerHands.Hand, rhs: PokerHands.Hand) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func > (lhs: PokerHands.Hand, rhs: PokerHands.Hand) -> Bool {
        return lhs.rank > rhs.rank
    }
}
