//
//  CardTable.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardTable {
    var players: [Player]
    var dealer: Dealer
// 점수계산 결과도 table에

    init(players: [Player], dealer: Dealer){
        self.players = players
        self.dealer = dealer
    }


    func stack() -> [CardStack] {
        var stackOfPlayers = [CardStack]()
        for player in players {
            stackOfPlayers.append(player.stack)
        }
        return stackOfPlayers
    }









}
