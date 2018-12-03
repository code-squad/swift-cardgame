//
//  Trump.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Trump: CardFormat {
    private var suits = Suits(rawValue: String())   //모양
    private var rank = Rank(rawValue: String())     //숫자
    
    init() {
        let shuffled = shuffleCard()
        self.suits = Suits(rawValue: shuffled.randSuits) ?? nil
        self.rank = Rank(rawValue: shuffled.randRank) ?? nil
    }
    
    private func shuffleCard() -> (randSuits: String, randRank: String) {
        let suits = ["spade", "club", "diamond", "heart"]
        let rank = ["ace", "two", "three", "four", "five", "six", "eight", "nine", "ten", "jack", "queen", "king"]

        let randSuits = suits[Int.random(in: 0 ..< suits.count)]
        let randRank = rank[Int.random(in: 0 ..< rank.count)]
        
        return (randSuits: randSuits, randRank: randRank)
    }
    
    func description() -> (suits: Suits?, rank: Rank?) {
        return (suits: self.suits, rank: self.rank)
    }
}
