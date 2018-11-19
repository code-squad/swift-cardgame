//
//  OutputView.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {

    static func notify(error: GameInputError) {
        print(error.rawValue)
    }

    private static func card(player: GamePlayer, number: Int, cardStack: String) {
        let name = ((player as? Dealer) != nil) ? "딜러" : "참가자#\(number)"
        print("\(name) \(cardStack)")
    }

    static func showResults(cardGame: CardGame) {
        cardGame.showResult(of: card(player:number:cardStack:))
        print("턴 종료")
    }

}
