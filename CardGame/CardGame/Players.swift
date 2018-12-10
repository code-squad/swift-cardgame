//
//  Players.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Players {
    private(set) var players: [GameParticipate] = []
    
    func makePlayer(by count: ChoiceParticipate, _ dealerPlayer: Dealer) {
        for _ in 0..<count.rawValue { players.append(Player()) }
        players.append(dealerPlayer)
    }
}
