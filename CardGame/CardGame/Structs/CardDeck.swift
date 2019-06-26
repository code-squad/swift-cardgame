//
//  CardDeck.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardDeck: Deck {
    typealias T = Card
    var elements: [Card]
    
    func count() -> Int {
        return 1
    }
    
    func removeOne() -> Card {
        return elements[0]
    }
    
    func shuffle() {
        ()
    }
    
    func reset() {
        ()
    }
   
}
