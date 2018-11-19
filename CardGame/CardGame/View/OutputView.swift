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

    private static func card(dealer: Bool, number: Int, cardStack: String) {
        let name = dealer ? "딜러" : "참가자#\(number)"
        print("\(name) \(cardStack)")
    }

    static func showResults(of cardGame: CardGame) {
        cardGame.showResult(of: card(dealer:number:cardStack:))
        print("턴 종료")
    }

}
