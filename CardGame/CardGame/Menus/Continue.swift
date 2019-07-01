//
//  Continue.swift
//  CardGame
//
//  Created by 이동영 on 30/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Count: Command {
    
    func execute<D>(deck: D) -> CommandResult where D : Deck {
        return CommandResult.count(remain: deck.count())
    }
    
}

