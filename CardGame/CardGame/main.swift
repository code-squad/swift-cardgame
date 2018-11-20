//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {

    static func runGame() {
        do {
            let gameInfo = try GameInputView.readGameInfo()
            let cardGame = try CardGame.init(gameMode: gameInfo.mode, numberOfPlayers: gameInfo.numberOfPlayers)
            while true {
                guard OutputView.playVisually(of: cardGame) else { break }
            }
        } catch let error as GameInputError {
            OutputView.notify(error: error)
        } catch {
            fatalError()
        }
    }

}

Main.runGame()
