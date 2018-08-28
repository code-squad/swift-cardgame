//
//  DTO.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardsWithPlayer : CustomStringConvertible {
    private var players : String
    private var cards : [Card]
    
    init(_ players : String , _ cards : [Card]) {
        self.players = players
        self.cards = cards
    }
    
    var description: String {
        return "\(self.players) \(self.cards)"
    }
}
