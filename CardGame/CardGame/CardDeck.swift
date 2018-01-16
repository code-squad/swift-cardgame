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
    }
    var count: Int {
        return self.cardDeck.count
    }
    
    mutating func resetCard() {
        var tempDeck = [Card]()
        for rank in CardGameInfo.RankOfCard.ranks {
            for suit in CardGameInfo.SuitsOfCard.suits {
                tempDeck.append(Card.init(rank: rank, suit: suit))
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
    mutating func shuffle() -> Array{
        self.sort { _,_ in arc4random_uniform(2) == 1 }
        return self
    }
}


