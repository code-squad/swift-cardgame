//
//  CardGame.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    var deck = CardDeck()
    
    mutating func run(menuNumber: Int) throws -> GameResult {
        guard let command = CommandFactory.create((menuNumber,self.deck)) else {
            throw Exception.unsupportedMenu
        }
        let result = command.execute()
        return result
    }
}
