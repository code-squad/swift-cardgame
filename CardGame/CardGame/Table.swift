//
//  CardStackPrint.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 5..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardStack {
    private (set) var stacks: [[Card]]

    init() {
        self.stacks = [[Card]]()
    }
    
    func hasStack(deck: Deck) -> Bool {
        var value = deck
        for numberOfStack in 1...7 {
            guard let element = try? value.makeStack(numberOfCards: numberOfStack) else {
                return false
            }
            stacks.append(element)
        }
        return true
    }
    
}
