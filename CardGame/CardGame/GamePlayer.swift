//
//  Player.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 7..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class GamePlayer {
    private let name : String
    private var cards : [Card]
    
    init(name:String, cards:[Card]) {
        self.name = name
        self.cards = cards
    }
}
