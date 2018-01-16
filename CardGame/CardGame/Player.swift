//
//  Player.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Player: CustomStringConvertible {
    var stack = CardStack([Card]())

    var description: String {
        return stack.description
    }

    init(stack: CardStack) {
        self.stack = stack
    }

}
