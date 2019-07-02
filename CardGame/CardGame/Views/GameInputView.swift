//
//  GameInputView.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    static func readGameMode() -> Int {
        print(GuideSentence.typeOfGame)
        for category in GameMode.allCases {
            print(category)
        }
        let input = InputView.readInput()
        return Int(input) ?? 0
    }
    
    static func readPlayerCount() -> Int {
        print(GuideSentence.numOfPlayers)
        let input = InputView.readInput()
        return Int(input) ?? 0
    }
}
