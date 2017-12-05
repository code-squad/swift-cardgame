//
//  GameOutputView.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 12. 5..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct GameOutputView {
    private let pokerGame: PokerGame

    init(pokerGame: PokerGame) {
        self.pokerGame = pokerGame
    }

    func showPokerTable() {
        print(pokerGame.showPokerTable())
    }

    func showWinner() {
        print(pokerGame.showWinner())
    }

}
