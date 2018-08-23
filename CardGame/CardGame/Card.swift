//
//  Card.swift
//  CardGame
//
//  Created by 이동건 on 21/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private let symbol: Symbol
    private let number: Number
    
    var description: String {
        return "\(symbol)\(number)"
    }
    
    init(symbol: Symbol, number: Number) {
        self.symbol = symbol
        self.number = number
    }
}
