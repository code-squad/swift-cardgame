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
        for i in 1...numberOfPaticipants {
            players.append(Participant(number: i))
        }
        players.append(Dealer())
        return players
    }
}
