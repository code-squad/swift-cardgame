//
//  CardStack.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 26..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardStack {
    private var stack: [Card]
    init() {
        stack = [Card]()
    }
    
    func push(card: Card) {
        stack.append(card)
    }
    
    func pop() -> [Card] {
        return stack
    }

}
