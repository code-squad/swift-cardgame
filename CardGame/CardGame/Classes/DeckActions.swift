//
//  CardGame.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DeckActions {
    var deck = CardDeck()
    
    mutating func run(menuNumber: Int) throws -> GameResult {
        guard var command = CommandFactory.create((menuNumber,self.deck)) else {
            throw InputException.unsupportedMenu
        }
        let result = command.execute()
        return result
    }
}
