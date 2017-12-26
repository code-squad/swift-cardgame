//
//  CardDeck.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardDeck {
    
    private var deck: [CardData]
    
    init() {
        deck = [CardData]()
        for shape in CardData.Shape.data {
            for number in CardData.Number.data {
                deck.append(CardData(shape: shape, number: number))
            }
        }
    }
    
    func count() -> Int {
        return deck.count
    }
    
    func shuffle() {
        //Fisher-Yates
        var cardOfChange = [CardData]()
        for _ in 0..<deck.count {
            let numberOfRandom = Int(arc4random_uniform(UInt32(deck.count)))
            cardOfChange.append(deck.remove(at: numberOfRandom))
        }
        self.deck = cardOfChange
    }
    
    func removeOne() -> CardData {
        return (deck.removeLast())
    }
    
    func reset() {
        deck.removeAll()
        let cardDeck = CardDeck()
        self.deck = cardDeck.deck
    }
    
    func makeCardStack() -> [CardStack] {
        var stack = [CardStack]()
        shuffle()
        for row in 0..<7 {
            let cardStack = CardStack()
            for _ in 0...row {
                let data = deck.popLast()
                cardStack.push(data: data!)
            }
            stack.insert(cardStack, at: row)
        }
        return stack
    }
    
}

