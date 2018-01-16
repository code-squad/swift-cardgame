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
        for rank in CardGameInfo.RankOfCard.TotalRank {
            for suit in 0 ..< CardGameInfo.SuitOfCard.TotalSuit.count {
                let card = Card(rank: CardGameInfo.RankOfCard(rawValue: rank)! , suit: CardGameInfo.SuitOfCard.TotalSuit[suit])
                tempDeck.append(card)
            }
            cardDeck = tempDeck
        }
    }
    
    mutating func suffle () {
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


