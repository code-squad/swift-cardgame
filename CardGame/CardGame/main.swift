//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let cardDeck = CardDeck()
    var game = PokerGame(cardDeck: cardDeck)
    var mode: GameMode
    var numberOfPlayers: NumberOfPlayers
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
        do {
            try game.run(numberOfPlayers: numberOfPlayers, option: mode)
        } catch let error as PokerGame.Error {
            print(error.localizedDescription)
            return
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            return
        }
        OutputView.printPlayers(game: game)
    } while (true)
}

main()
