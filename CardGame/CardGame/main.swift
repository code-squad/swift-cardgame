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
    var option: GameOption
    var numberOfPlayers: Int
    repeat {
        do {
            option = try GameInputView.readGameOption()
            numberOfPlayers = try GameInputView.readNumberOfPlayers(checkRange: NumberChecker.isValid)
        } catch let error as GameInputView.Error {
            print(error.localizedDescription)
            return
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            return
        }
        do {
            try game.run(numberOfPlayers: numberOfPlayers, option: option)
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
