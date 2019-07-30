//
//  PlayerGenerator.swift
//  CardGame
//
//  Created by 이진영 on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct PlayerGenerator {
    static func generatePlayer(numberOfPlayer: NumberOfPlayer) -> [Player] {
        return (1...numberOfPlayer.rawValue).map { Player(name: "참가자#\($0)") }
    }
}
