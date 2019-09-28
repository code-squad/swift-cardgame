//
//  Parser.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Parser {
    static func parse(_ answer: String) throws -> Inquiry {
        guard let answerNumber = Int(answer) else {
            throw CardGameError.invalidParsing
        }
        guard let result = Inquiry(rawValue: answerNumber) else {
            throw CardGameError.invalidParsing
        }
        return result
    }
}
