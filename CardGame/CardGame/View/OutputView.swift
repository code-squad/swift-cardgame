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

    private static func card(name: String, cardStack: String) {
        print("\(name) \(cardStack)")
    }

    static func showResults(of cardGame: CardGame) {
        cardGame.showResult(of: card(name:cardStack:))
        print("턴 종료")
    }

}
