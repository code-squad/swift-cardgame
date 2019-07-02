//
//  PlayerFactory.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayerFactory {
    static func makeAllPlayers(including numberOfPaticipants: Int) -> [Player] {
        var players = [Player]()
        for _ in 0..<numberOfPaticipants {
            players.append(Participant())
        }
        players.append(Dealer())
        return players
    }
}
