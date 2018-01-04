//
//  main.swift
//  CardGame
//
//  Created by YUAMING on 10/10/2017.
//  Copyright © 2017 YUAMING. All rights reserved.
//

import Foundation

func main() throws {
    do {
        let selectedMenu = try GameInputView.selectMenus()
        let playerCount = try GameInputView.selectNumberOfPlayers()
        let pokerGameData = try PokerGame.start(choiceMenu: selectedMenu, playerCount: playerCount)
        GameOutputView.printResult(pokerGameData)
    } catch let e as GameError {
        print(e.localizedDescription)
    }
}

try main()
