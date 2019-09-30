//
//  CardDeck.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class CardDeck {
    private var cards : NSMutableArray!
    private var cardsOrigin : NSMutableArray!
    
    init() {
        cardsOrigin = []
        
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cardsOrigin.add(Card(suit: suit, rank: rank))
            }
        }
        
        cards = cardsOrigin.mutableCopy() as! NSMutableArray
    }
    
    deinit {
        cards.removeAllObjects()
        cardsOrigin.removeAllObjects()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() {
        for index in 0...cards.count-1 {
            let rand = Int.random(in: 0...cards.count-1 - index) + index
            //let randInt = (arc4random() % (cards.count - x)) + x;
            cards.exchangeObject(at: index, withObjectAt: rand)
        }
    }
    
    func removeOne() throws -> Card {
        guard cards.count > 0 else {
            throw CardGameError.emptyCardDeck
        }
        let pickedCard = cards[0]
        cards.removeObject(at: 0)
        return pickedCard as! Card
    }
    
    func reset() {
        cards.removeAllObjects()
        cards = cardsOrigin.mutableCopy() as! NSMutableArray
    }
    
    
}

extension CardDeck : CustomStringConvertible {
    var description: String {
        var cardPrinted : String = ""
        
        for (index, cardObject) in cards.enumerated() {
            let card = cardObject as! Card
            cardPrinted += card.description
            if (index+1) % 13 == 0 {
                cardPrinted += "\n"
            }
            else {
                cardPrinted += " "
            }
        }
        
        return cardPrinted
    }
}

class CardDeckArray {
    private var cards : [Card]!
    
    init() {
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    func shuffle() -> Void {
        cards.shuffle()
    }
    
    func removeOne() -> Card {
        let pickedCard = cards[0]
        cards.remove(at: 0)
        return pickedCard
    }
    
    func reset() -> Void {
        cards = []
        
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
}
