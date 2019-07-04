//
//  RangeChecker+NumberChecker.swift
//  CardGame
//
//  Created by BLU on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol RangeChecker {
    static func isValid(_ value: String) -> Bool
}

struct NumberChecker: RangeChecker {
    static func isValid(_ value: String) -> Bool {
        return ("1"..."4").contains(value)
    }
}
