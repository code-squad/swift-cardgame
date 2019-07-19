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
    var numberOfPlayers: Players
    repeat {
        do {
            mode = try GameInputView.readGameMode()
            numberOfPlayers = try GameInputView.readNumberOfPlayers()
        } catch let error as GameInputView.Error {
            print(error.localizedDescription)
            return
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            return
        }
        game.run(numberOfPlayers: numberOfPlayers, mode: mode)
        OutputView.printPlayers(game: game)
    } while (game.isPlayble())
}

main()
