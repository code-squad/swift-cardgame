//
//  Reset.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Reset: Command {
    var deck: CardDeck
    
    func execute() -> GameResult {
        self.deck.reset()
        return  GameResult.reset(remain: self.deck.count())
    }
        
}
