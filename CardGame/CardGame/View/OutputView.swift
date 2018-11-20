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

    private static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    private static func winner(name: String) {
        print("\(name) 우승")
    }

    static func playVisually(of cardGame: CardGame) -> Bool{
        return cardGame.play(visually: card(name:cardStack:), screen: clear, ended: winner)
    }

}
