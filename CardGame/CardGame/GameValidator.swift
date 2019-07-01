//
//  GameValidator.swift
//  CardGame
//
//  Created by Daheen Lee on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameValidator {
    static let validRangeOfPartipants = 1...4
    
    static func canPlayMore(numberOfCards: Int, numberOfParticipants: Int, remainingCardsCount: Int) -> Bool {
        let numberOfCardsInNeed = numberOfCards * (numberOfParticipants + 1)
        return validRangeOfPartipants.contains(numberOfParticipants)
            && numberOfCardsInNeed <= remainingCardsCount
    }
}
