//
//  Player.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Player: CustomStringConvertible {
    var stack: CardStack
    var position: Int?

    var description: String {
        return "참가자#\(position!) " + stack.description
    }

    init(stack: CardStack, position: Int?) {
        self.stack = stack
        self.position = position
    }

}
