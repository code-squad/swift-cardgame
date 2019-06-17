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
        if !isInRange(number, base: PlayerRange.base.rawValue, limit: PlayerRange.limit.rawValue) {
            throw GameMenuError.outOfRangePlayer
        }
        return number
    }
    
    static func validateGameType(_ input: String) throws -> GameType{
        let number = try convertInteger(input)
        let instruction : GameType = try GameType(number)
        return instruction
    }
    
    static func validateGameMenu (_ input: String) throws -> GameMenu {
        let number = try convertInteger(input)
        let instruction : GameMenu = try GameMenu(number)
        return instruction
    }
    
    static private func convertInteger(_ input: String) throws -> Int {
        guard let selectedNumber = Int(input) else {
            throw GameMenuError.notANumber
        }
        return selectedNumber
    }
    
    static private func isInRange(_ number : Int, base: Int, limit: Int) -> Bool {
        if number >= base && number <= limit {
            return true
        }
        return false
    }
}
