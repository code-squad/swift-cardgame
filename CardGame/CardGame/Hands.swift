//
//  Hands.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Hands {

    enum PokerHands: Int {
        case NoPair = 0
        case OnePair
        case TwoPair
        case Triple
        case Straight
        case Flush
        case FullHouse
        case FourOfAKind
        case StraightFlush
        case RoyalFlush
    }

    func isPair(_ cardStack: CardStack) -> [PokerHands] {
        let cards = cardStack.cards
        let pairCheck = cards.reduce(into: [String:[Card]]()) {
            $0[$1.denomination.description, default: []].append($1)
        }
        var resultArray = [PokerHands]()
        pairCheck.forEach {
            switch $0.value.count {
            case 4: resultArray.append(.FourOfAKind)
            case 3: resultArray.append(.Triple)
            case 2: resultArray.append(.OnePair)
            default: resultArray.append(.NoPair)
            }
        }
        return resultArray
    }


    func isFlush(_ cardStack: CardStack) -> Bool {
        var count = 0
        let cards = cardStack.cards
        for i in 1..<cards.count {
            if cards[i-1].suit.hashValue == cards[i].suit.hashValue {
                count += 1
            }
        }
        return count >= 4
    }

    func matchHand(_ cardStack: CardStack) -> PokerHands {
        if isFlush(cardStack) {
            return .Flush
        }

        return .OnePair
    }





}
