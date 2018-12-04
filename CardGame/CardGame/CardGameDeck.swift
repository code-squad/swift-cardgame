//
//  CardGameDeck.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 4..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol CardGameDeck {
    func count() -> Int
    mutating func shuffle()
    mutating func removeOne() -> Card?
}
