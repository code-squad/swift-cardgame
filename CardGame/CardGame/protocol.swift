//
//  protocol.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol CardFormat {
    func description() -> String
}

protocol CardCountable {
    func count() -> Int
}

protocol DeckFormat: CardCountable, CardScatterable {
    mutating func reset()
    mutating func shuffle()
    mutating func removeOne() -> CardFormat
}

protocol CardScatterable {
    mutating func drawCardStud(of cards: Int) -> [Trump]
}

protocol StackFormat {
    func description() -> String
}
