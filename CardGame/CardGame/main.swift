//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let dealer = PokerDealer(hand: Hand(), deck: CardDeck())
    var game = PokerGame(dealer: dealer)
    var players: [Player]
    var option: GameOption
    repeat {
        do {
            option = try GameInputView.readGameOption()
            let numberOfPlayers = try GameInputView.readNumberOfPlayers(checkRange: NumberChecker.isValid)
            players = PlayerGenerator.generatePlayers(by: numberOfPlayers)
        } catch let error as GameInputView.Error {
            print(error.localizedDescription)
            return
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            return
        }
        do {
            try game.run(players: players, option: option)
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
