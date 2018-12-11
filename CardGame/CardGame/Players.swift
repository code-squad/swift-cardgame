//
//  Players.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol PlayersPrintable {
    func getNames() -> [String]
    func getCards() -> [[Card]]
}

class Players {
    private var players: [GameParticipate] = []
    
    func makePlayer(by count: ChoiceParticipate, _ dealerPlayer: Dealer) {
        for playerNumber in 0..<count.rawValue {
            players.append(Player(name: "참가자#\(playerNumber+1)"))
        }
        players.append(dealerPlayer)
    }
    
    func countPlayers() -> Int {
        return players.count
    }
    
    func getPlayers() -> [GameParticipate] {
        return players
    }
}

extension Players : PlayersPrintable {
    func getNames() -> [String] {
        var playerNames: [String] = []
        for player in players { playerNames.append(player.name) }
        return playerNames
    }
    
    func getCards() -> [[Card]] {
        var playerCards: [[Card]] = []
        for player in players { playerCards.append(player.cards) }
        return playerCards
    }
}
