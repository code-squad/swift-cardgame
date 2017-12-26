//
//  CardStack.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 26..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardStack {
    private var stack: [CardData]
    
    init() {
        stack = [CardData]()
    }
    
    func push(card: CardData) {
        stack.append(card)
    }
    
    func pop() -> [CardData] {
        return stack
    }

}
