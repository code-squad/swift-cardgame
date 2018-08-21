//
//  Card.swift
//  CardGame
//
//  Created by 이동건 on 21/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    private let symbol: CardDataSource
    private let number: CardDataSource
    
    var description: String {
        return "\(symbol)\(number)"
    }
    
    init(symbol: CardDataSource, number: CardDataSource) {
        self.symbol = symbol
        self.number = number
    }
}
