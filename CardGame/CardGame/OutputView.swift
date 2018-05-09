//
//  OutputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardDeckable {
    mutating func shuffle() -> String
    mutating func removeOne() -> String
    mutating func reset() -> String
}

struct OutputView {
    static func printCard(_ card: Card) {
        print(card)
    }
}
