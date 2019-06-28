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
        cardGame.config(number: menuNumber)
        OutputView.printGameResult(game: cardGame)
    } while (true)
}

main()
