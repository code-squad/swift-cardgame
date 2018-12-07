//
//  ValidChecker.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 7..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ValidChecker {
    static func check(numberOfParticipant:Int) -> Bool {
        let oneToFour = 1...4
        return oneToFour.contains(numberOfParticipant)
    }
    
    static func check(gameType:Int) -> Bool {
        return gameType == 5 || gameType == 7
    }
    
    static func checkContinuable(numberOfParticipant:Int, gameType:Int, numberOfCards:Int) -> Bool {
        return numberOfCards > (numberOfParticipant + 1) * gameType
    }
}
