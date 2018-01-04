//
//  Player.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 28..
//  Copyright © 2017년 YUAMING. All rights reserved.
//

import Foundation

struct Player {
    private let hand: Hand
    private let name: String
    
    init(hand: Hand, name: String) {
        self.hand = hand
        self.name = name
    }
    
    var handInformation: Hand {
        return self.hand
    }
    
    var nameInformation: String {
        return self.name
    }
}
