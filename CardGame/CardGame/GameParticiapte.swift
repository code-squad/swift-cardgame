//
//  ParticipatablePlayer.swift
//  CardGame
//
//  Created by 윤동민 on 10/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class GameParticipate {
    var cards : [Card] = []

    func receiveCard(_ cards: [Card]) {
        self.cards = cards
    }
}
