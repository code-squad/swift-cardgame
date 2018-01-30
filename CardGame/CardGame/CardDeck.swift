//
//  CardDeck.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct CardDeck {
    private var cardDeck = [Card]()
    init() {
        self.resetCard()
        self.shuffle()
    }
    var count: Int {
        return self.cardDeck.count
    }
    mutating func resetCard() {
        var tempDeck = [Card]()
        for rank in Card.RankOfCard.ranks {
            for suit in Card.SuitsOfCard.suits {
                tempDeck.append(Card(rank, suit))
            }
            cardDeck = tempDeck
        }
    }
    
    mutating func shuffle () {
        cardDeck = cardDeck.shuffle()
    }
    
    mutating func pickCard () -> Card {
        return cardDeck.removeLast()
    }
    
}

extension Array {
    func shuffle() -> Array<Card> {
        let shuffledArray = self.sorted { _,_ in arc4random_uniform(2) == 1 }
        return shuffledArray as? Array<Card> ?? Array<Card>()
    }
}


