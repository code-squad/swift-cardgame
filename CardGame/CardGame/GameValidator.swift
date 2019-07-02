//
//  GameValidator.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameValidator {
    static func hasEnoughCards(for gameMode: GameMode, numberOfParticipants: NumberOfParticipants, remainingCardsCount: Int) -> Bool {
        let numberOfCardsInNeed = gameMode.numberOfCards * (numberOfParticipants.count + 1)
        return numberOfCardsInNeed <= remainingCardsCount
    }
}
