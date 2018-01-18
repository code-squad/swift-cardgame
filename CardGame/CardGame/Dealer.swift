//
//  Dealer.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Dealer: Player {

    override var description: String {
        return "딜러 " + getStack().description
    }

    init(stack: CardStack) {
        super.init(stack: stack, position: nil)
    }

}
