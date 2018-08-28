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
        CardDeck.reset()
        CardDeck.shuffle()
        
        while true {
            // GameType
            guard let gameType = try InputView.readGameType() else { throw CardError.inputNil }

            // NumberOfPlayers
            guard let numberOfplayers =  try InputView.readPlayer() else { throw CardError.inputNil }

            let game = Game.init(gameType, numberOfplayers)
            guard let cards = game.shareCards() else { throw CardError.noCardsRemaining }
            for card in cards {
                OutputView.printCards(elements: card)
            }
        }
    }
}

do {
    try Main.run()
} catch let cardError as CardError {
    OutputView.printError(error: cardError)
} catch {
    OutputView.printError(error: CardError.unknown)
}
