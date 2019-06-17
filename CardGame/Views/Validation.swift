//
//  Validation.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Validation {
    static func validateGamePlayerNumbers(_ input: String) throws -> Int {
        let number = try convertInteger(input)
        if !isInRange(number, base: 1, limit: 3) {
            throw GameMenuError.outOfRangePlayer
        }
        return number
    }
    
    static func validateGameType(_ input: String) throws -> GameType{
        let number = try convertInteger(input)
        if !isInRange(number, base: 1, limit: 3) {
            throw GameMenuError.outOfRange
        }
        var instruction : GameType = GameType.sevenCard
        switch number {
        case 1:
            instruction = GameType.sevenCard
        case 2:
            instruction = GameType.fiveCard
        default:
            break
        }
        return instruction
    }
    
    static func validateGameMenu (_ input: String) throws -> GameMenu {
        let number = try convertInteger(input)
        let instruction : GameMenu = try GameMenu(number)
        return instruction
    }
    
    static func convertInteger(_ input: String) throws -> Int {
        guard let selectedNumber = Int(input) else {
            throw GameMenuError.notANumber
        }
        return selectedNumber
    }

}
