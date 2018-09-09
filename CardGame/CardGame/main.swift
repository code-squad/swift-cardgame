//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    public static func run() throws {
        let cardDeck = CardDeck.init()
        cardDeck.reset()
        cardDeck.shuffle()
        
        while true {
            let gameType = try InputView.readGameType()
            let numberOfplayers =  try InputView.readPlayer()
            guard let game = Game.init(gameType, numberOfplayers, cardDeck) else { throw CardError.noCardsRemaining }
            OutputView.printCards(game: game)
            OutputView.printWinner(game: game)
        }
    }
}

do {
    try Main.run()
} catch let cardError as CardError {
    OutputView.printError(error: cardError)
} catch let inputError as InputError {
    OutputView.printError(error: inputError)
} catch {
    OutputView.printError(error: CardError.unknown)
}
