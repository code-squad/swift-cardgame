//
//  Player.swift
//  CardGame
//
//  Created by joon-ho kil on 5/27/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Player: Participant {
    private let name: String
    private var cards = [Card]()
    
    init(name: String, cards: [Card]){
        self.name = name
        self.cards = cards
    }
    
    func getName() -> String {
        return name
    }
    
    func getCards() -> [Card] {
        return cards
    }
}
