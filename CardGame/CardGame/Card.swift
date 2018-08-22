//
//  Card.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Card {
    let shape: UnicodeScalar?
    let number: UnicodeScalar?
    
    init() {
        self.shape = CardShape.pick()
        self.number = CardNumber.pick()
    }
    
    func pick() -> String? {
        guard let shape = self.shape , let number = self.number else { return nil }
        return "\(shape.description)\(number.description)"
    }
}
