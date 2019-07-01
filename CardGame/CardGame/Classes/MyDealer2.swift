//
//  CardGame.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MyDealer2: MyPlayer, Dealer {
    
    var deck = CardDeck()
    
    override init(name: String = "딜러"){
        super.init(name:name)
    }
    
    func execute(_ command: Command) -> CommandResult {
        let result = command.execute(deck: self.deck)
        return result
    }
}
