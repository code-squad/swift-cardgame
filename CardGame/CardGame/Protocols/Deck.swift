//
//  Deck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


protocol Deck where Self: Equatable {
    associatedtype Element: GameElement
    
    func count() -> Int
    mutating func removeOne() -> Element?
    mutating func shuffle()
    mutating func reset()
}
