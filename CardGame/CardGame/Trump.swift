//
//  Trump.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Trump: CardFormat, Equatable {
    private var suits = Suits(rawValue: String())   //모양
    private var rank = Rank(rawValue: String())     //숫자
    
    init() {
        let elements = makeRandomElements()
        self.suits = Suits(rawValue: elements.randSuits) ?? nil
        self.rank = Rank(rawValue: elements.randRank) ?? nil
    }
    
    private func makeRandomElements() -> (randSuits: String, randRank: String) {
        let suits = Suits.allCases
        let rank = Rank.allCases

        let randSuits = suits[Int.random(in: 0 ..< suits.count)]
        let randRank = rank[Int.random(in: 0 ..< rank.count)]
        
        return (randSuits: randSuits.rawValue, randRank: randRank.rawValue)
    }
    
    func description() -> String {
        guard let suits = suits, let rank = rank else {
            return "예상하지 못한 오류가 발생했습니다"
        }
        return "\(suits.description)\(rank.description)"
    }
    
    static func == (lhs: Trump, rhs: Trump) -> Bool {
        return (lhs.suits == rhs.suits) && (lhs.rank == rhs.rank)
    }
}
