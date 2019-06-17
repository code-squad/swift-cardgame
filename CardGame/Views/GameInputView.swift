//
//  GameInputView.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView{
    static func selectGame() -> Void {
        print(GameMenuScript.selectGameType)
        print("1. \(GameType.sevenCard)")
        print("2. \(GameType.fiveCard)")
    }
    static func selectNumberOfPlayers() -> Void{
        print(GameMenuScript.selectNumberOfPlayers)
    }
}
