//
//  Validation.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Validation {
    
    static func validate (_ input: String) throws -> GameMenu {
        let number = try convertInteger(input)
        if !isInRange(number) {
            throw GameMenuError.outOfRange
        }
        var instruction : GameMenu = GameMenu.initialization
        switch number {
        case 1:
            instruction = GameMenu.initialization
        case 2:
            instruction = GameMenu.shuffle
        case 3:
            instruction = GameMenu.drawOne
        default:
            break
        }
        return instruction
        
    }
    static func convertInteger(_ input: String) throws -> Int {
        guard let selectedNumber = Int(input) else {
            throw GameMenuError.notANumber
        }
        return selectedNumber
    }
    
    static func isInRange(_ input: Int) -> Bool {
        if input >= 1 && input <= 3 {
            return true
        }
        return false
    }
}
