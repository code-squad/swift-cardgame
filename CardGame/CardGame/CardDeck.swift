//
//  CardDeck.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 카드 패는 네 가지 모양과 숫자 상수로 고정된 값이므로 enum을 사용했습니다.

class CardDeck {
    
    // MARK: Enums for card format
    
    enum Suit: String {
        case heart = "♥️"
        case diamond = "♦️"
        case clover = "♣️"
        case spade = "♠️"
        
        static let allValues = [heart, diamond, clover, spade]
    }
    
    enum Denomination: Int, CustomStringConvertible {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        var description: String {
            switch self {
            case .one: return "A"
            case .eleven: return "J"
            case .twelve: return "Q"
            case .thirteen: return "K"
            default: return String(self.rawValue)
            }
        }
        
        static let allValues = [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen]
    }
    
    // MARK: CardDeck functions for running a program
    
    private var cards = [Card]()
    
    func reset() {
        var cards = [Card]()
        for shape in Suit.allValues {
            for number in Denomination.allValues {
                cards.append(Card(suit: shape, denomination: number))
            }
        }
        self.cards = cards
    }
    
    func shuffle() {
        var tempCards = self.cards
        var shuffledCards = [Card]()
        
        while 0 <= tempCards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(tempCards.count)))
            let pickedCard = tempCards.remove(at: randomIndex) // tempCards.count --
            shuffledCards.append(pickedCard) // shuffledCards.count ++
        }
        self.cards = shuffledCards
        
        /*
        for _ in 0..<tempCards.count {
        let randomIndex = Int(arc4random_uniform(UInt32(tempCards.count)))
        let pickedCard = tempCards.remove(at: randomIndex) // tempCards.count --
            shuffledCards.append(pickedCard) // shuffledCards.count ++
        }
        */
    }
    
    
    
    
}

