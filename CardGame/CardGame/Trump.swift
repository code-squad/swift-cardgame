//
//  Trump.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Trump: CustomStringConvertible {
    private var suits = Suits(rawValue: String())   //모양
    private var rank = Rank(rawValue: String())     //숫자
    
    init(suits: Suits.RawValue, rank: Rank.RawValue) {
        self.suits = Suits(rawValue: suits)
        self.rank = Rank(rawValue: rank)
    }

    var description: String {
        guard let suits = suits, let rank = rank else {
            return "예상하지 못한 오류가 발생했습니다"
        }
        return "\(suits.description)\(rank.description)"
    }
}
