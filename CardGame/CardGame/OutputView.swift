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
    static private let resetCard: Int = 1
    static private let shuffleCard: Int = 2
    static private let removeOneCard: Int = 3
    
    static func printResult(cardDeck: inout CardDeckable, menu: Menu) {
        switch menu {
        case .resetCard:
            print(cardDeck.reset())
        case .shuffleCard:
            print(cardDeck.shuffle())
        case .removeOneCard:
            print(cardDeck.removeOne())
        }
        print()
    }
}
