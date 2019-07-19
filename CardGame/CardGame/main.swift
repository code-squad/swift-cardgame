//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var game = PokerGame()
    var mode: GameMode
    var personnel: Personnel
    repeat {
        do {
            mode = try GameInputView.readGameMode()
            personnel = try GameInputView.readNumberOfPlayers()
        } catch let error as GameInputView.Error {
            OutputView.printError(error.localizedDescription)
            return
        } catch {
            OutputView.printError("\(ErrorMessage.unexpectedError) : \(error)")
            return
        }
        game.run(personnel: personnel, mode: mode)
        OutputView.printPlayers(game: game)
    } while (game.isPlayble())
}

main()
