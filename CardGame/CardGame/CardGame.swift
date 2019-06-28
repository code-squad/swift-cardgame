//
//  CardGame.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    
    enum State: Int {
        case initializeCards = 1
        case shuffleCards
        case drawOneCard
    }
    
    private(set) var currentState: State = .initializeCards
    private(set) var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    mutating func config(number: Int) {
        if let nextState = State(rawValue: number) {
            currentState = nextState
            return
        }
    }
}
