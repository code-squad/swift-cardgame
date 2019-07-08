//
//  PlayerFactory.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayerFactory {
    static func makeAllPlayers(including numberOfPaticipants: Int) -> Players {
        var participants = [Participant]()
        for _ in 0..<numberOfPaticipants {
            participants.append(Participant())
        }
        return Players(dealer: Dealer(), participants: participants)
    }
}
