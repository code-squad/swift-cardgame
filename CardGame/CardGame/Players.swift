//
//  Players.swift
//  CardGame
//
//  Created by 이동건 on 12/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Players {
    private var players: [Player]
    var playerCards: [String] {
        return players.map {"\($0)"}
    }
    
    init(_ players: [Player]) {
        self.players = players
    }
}
