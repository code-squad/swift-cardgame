//
//  PockerPlayerRegistry.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PockerPlayerRegistry {
    
    static var gameDealer: PockerPlayer {
        return PockerPlayer(name: "딜러")
    }
    
    static func players(with numberOfPlayers: Int) -> [PockerPlayer] {
        var players: [PockerPlayer] = []
        Array(0..<numberOfPlayers).forEach {
            players.append(PockerPlayer(name: "참가자#\($0+1)"))
        }
        return players
    }
}
