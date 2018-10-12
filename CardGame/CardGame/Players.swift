//
//  Players.swift
//  CardGame
//
//  Created by 이동건 on 12/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Players: GroupProtocol {
    private var players: [Player]
    func display(convert: ([String])->()) {
        let cards: [String] = players.map {"\($0)"}
        return convert(cards)
    }
    init(_ players: [Player]) {
        self.players = players
    }
}
