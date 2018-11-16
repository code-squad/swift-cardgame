//
//  File.swift
//  CardGame
//
//  Created by 윤지영 on 16/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardStacks: CustomStringConvertible {
    private var cardStacks: [CardStack] = []

    mutating func add(stack: CardStack) {
        cardStacks.append(stack)
    }

    var description: String {
        let allCardStacks = cardStacks
            .map { "\($0)" }
            .joined(separator: "\n")
        return allCardStacks
    }
}
