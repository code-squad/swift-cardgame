//
//  CardDeck.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardDeck {
    
    private var card: [CardData]
    
    init() {
        card = [CardData]()
        for shape in CardData.Shape.data {
            for number in CardData.Number.data {
                card.append(CardData(shape: shape, number: number))
            }
        }
    }
    
    func count() -> Int {
        return card.count
    }
    
    func shuffle() {
        //Fisher-Yates
        var cardOfChange = [CardData]()
        for _ in 0..<card.count {
            let numberOfRandom = Int(arc4random_uniform(UInt32(card.count)))
            cardOfChange.append(card.remove(at: numberOfRandom))
        }
        self.card = cardOfChange
    }
    
    func removeOne() -> CardData {
        return (card.removeLast())
    }
    
    func reset() {
        card.removeAll()
        let cardDeck = CardDeck()
        self.card = cardDeck.card
    }
    
    func makeCardStack() -> [CardStack] {
        var stack = [CardStack]()
        shuffle()
        for row in 0..<7 {
            let cardStack = CardStack()
            for _ in 0...row {
                let data = card.popLast()
                cardStack.push(data: data!)
            }
            stack.insert(cardStack, at: row)
        }
        return stack
    }
    
}

