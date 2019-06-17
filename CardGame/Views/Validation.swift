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
