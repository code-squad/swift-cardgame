//
//  protocol.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol CardFormat {
    func description() -> (suits: Suits?, rank: Rank?)
}

protocol CardCountable {
    func count() -> Int
}

protocol DeckFormat: CardCountable {
    mutating func reset()
    mutating func shuffle()
    mutating func removeOne() -> CardFormat
}
