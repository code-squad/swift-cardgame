//
//  PokerRules.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

enum PokerRules: Int {
    case none, sevenStud, fiveStud

    var value: Int {
        switch self {
        case .sevenStud:
            return 7
        case .fiveStud:
            return 5
        case .none:
            return 0
        }
    }
}
