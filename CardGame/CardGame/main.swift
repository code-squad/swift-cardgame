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
    var cardGame = CardGame(deck: cardDeck)
    repeat {
        let menuNumber = InputView.readMenuNumber()
        do {
            try cardGame.config(number: menuNumber)
        } catch let error as CardGame.Error {
            print(error.localizedDescription)
            break
        } catch {
            print(error)
            break
        }
        OutputView.printGameResult(game: cardGame)
    } while (true)
}

main()
