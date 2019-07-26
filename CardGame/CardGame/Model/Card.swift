//
//  Card.swift
//  CardGame
//
//  Created by JH on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private var pattern: CardPattern
    private var number: CardNumber

    init(pattern: CardPattern, number: CardNumber) {
        self.pattern = pattern
        self.number = number
    }
    
    var description: String {
        return "\(pattern)\(number)"
    }
}

