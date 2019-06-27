//
//  Deck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


protocol Deck {
    associatedtype T
    
    func count() -> Int
    mutating func removeOne() -> T?
    mutating func shuffle()
    mutating func reset()
}
