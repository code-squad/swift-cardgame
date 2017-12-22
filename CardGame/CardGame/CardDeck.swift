//
//  CardDeck.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardDeck {
    
    var card = [CardData]()
    
    init() {
        for shape in CardData.Shape.data {
            for number in CardData.Number.data {
                card.append(CardData(shape: shape, number: number))
            }
        }
    }
    
    func count() -> Int {
        return card.count
    }
    
    func shuffle(cardOfChange: [CardData], cardOfOrigin: [CardData]) -> [CardData] {
        //Fisher-Yates
        if cardOfOrigin.count < 1 {
            return cardOfChange
        }
        var cardToShuffle = cardOfOrigin
        var cardByShuffle = cardOfChange
        let numberOfRandom = Int(arc4random_uniform(52))
        cardByShuffle.append(cardToShuffle.remove(at: numberOfRandom))
        return shuffle(cardOfChange: cardByShuffle, cardOfOrigin: cardToShuffle)
        
    }
    
    func removeOne() -> CardData {
        return card.removeLast()
    }
    
    func reset() -> [CardData] {
        card.removeAll()
        return card
    }
}

