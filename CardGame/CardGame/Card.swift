//
//  Card.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 카드 객체
class Card {
    private let rank: CardGameInfo.RankOfCard
    private let suit: CardGameInfo.SuitsOfCard
    
    init(rank: CardGameInfo.RankOfCard, suit: CardGameInfo.SuitsOfCard) {
        self.rank = rank
        self.suit = suit
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.suit.description + self.rank.description
    }
}


