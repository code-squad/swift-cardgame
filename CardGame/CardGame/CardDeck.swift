//
//  CardDeck.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CardDeck: CustomStringConvertible {
    private var cards = [Card]()
    var description: String {
        return "총 \(self.cards.count)장의 카드가 남아있습니다.\n"
    }
    
    init() {
        var cards = [Card]()
        for shape in Suit.allValues {
            for number in Denomination.allValues {
                cards.append(Card(suit: shape, denomination: number))
            }
        }
        self.cards = cards
    }
    
    func reset() -> CardDeck {
        return CardDeck()
    }
    
    func shuffle() {
        var tempCards = self.cards
        var shuffledCards = [Card]()
        
        while 0 < tempCards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(tempCards.count)))
            let pickedCard = tempCards.remove(at: randomIndex)
            shuffledCards.append(pickedCard)
        }
        self.cards = shuffledCards
    }
    
    func removeOne() -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
        let pickedCard = self.cards.remove(at: randomIndex)
        return pickedCard
    }
    
    private func count() -> Int {
        return self.cards.count
    }
    
    func makeShuffleMessage() -> String {
        return "전체 \(self.cards.count)장의 카드를 섞었습니다.\n"
    }
    
}


extension CardDeck {
    
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
   
}

    

