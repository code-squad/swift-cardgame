//
//  Card.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/27.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// Class에 비해 빠르고 간단하게 데이터를 저장이 가능하여 Struct선택 
struct Card: Hashable {
    
    private(set) var rank:  Rank
    private(set) var suite: Suite
    
    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description: String {
            var result: String
            switch self {
            case .jack  : result = "J"
            case .queen : result = "Q"
            case .king  : result = "K"
            case .ace   : result = "A"
            default     : result = "\(self.rawValue)"
            }
            return result
        }
    }
    
    // https://en.wikipedia.org/wiki/Miscellaneous_Symbols
    enum Suite: Character, CaseIterable {
        case spade   = "\u{2660}"
        case heart   = "\u{2661}"
        case diamond = "\u{2662}"
        case club    = "\u{2663}"
    }
    
    init(rank: Rank, suite: Suite) {
        self.rank = rank
        self.suite = suite
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suite.rawValue)\(rank)"
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue > rhs.rank.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue == rhs.rank.rawValue
    }
}
