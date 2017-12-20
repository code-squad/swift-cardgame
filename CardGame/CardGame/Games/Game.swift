//
//  CardGame.swift
//  CardGame
//
//  Created by yuaming on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Game {
    private(set) var dealer: Dealer
    
    init(_ dealer: Dealer) {
        self.dealer = dealer
    }
    
    enum Menu: Int {
        case sevenCards = 1, fiveCards
    }
    
    mutating func start(gameMenu _gameMenu: Menu, playerCount _playerCount: Int) throws {
        let cardsToPlayCount = _gameMenu == .fiveCards ? 5 : 7
        let playerCount = _playerCount
        
        for _ in 0...playerCount {
            try dealer.setCardStacks(cardsToPlayCount)
        }
    }
}
