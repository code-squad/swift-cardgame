//
//  HandValue.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandValue: Int {
    case highCard = 0, pair, twoPairs, triple, straight, fourCard
}

extension HandValue: Comparable {
    static func < (lhs: HandValue, rhs: HandValue) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    static func > (lhs: HandValue, rhs: HandValue) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
    
    static func == (lhs: HandValue, rhs: HandValue) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

