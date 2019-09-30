//
//  CardDeck.swift
//  CardGame
//
//  Created by RENO1 on 29/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeckImpl:CardDeck {
    private var cardList:[Card]
    
    init() {
        self.cardList = [Card]()
        initCard()
    }
    
    mutating func initCard() {
        cardList = [Card]()
        for shape in Shape.allCases {
            addCards(shape: shape)
        }
    }
    
    mutating func shuffle() {
        cardList.shuffle()
    }
    
    mutating func remove(count: Int) throws {
        guard cardList.count - count > 0 else {
            throw CardError.NO_CARD
        }
        
        for _ in 0 ..< count {
            cardList.remove(at: 0)
        }
    }
    
    func selectCard() throws -> Card {
        guard cardList.count > 0 else {
            throw CardError.NO_CARD
        }
        return cardList[0]
    }
    
    func getTotalCardCount() -> Int {
        return cardList.count
    }
    
    private mutating func addCards(shape: Shape) {
        for number in 1 ... 13 {
            cardList.append(Card(shape: shape, cardNumber: CardNumber(rawValue: number)!))
        }
    }
}

protocol CardDeck {
    mutating func initCard()
    mutating func shuffle()
    mutating func remove(count:Int) throws
    func selectCard() throws -> Card
    func getTotalCardCount() -> Int
}
