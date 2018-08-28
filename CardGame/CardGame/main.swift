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
            let gameType = try InputView.readGameType()
            
            // NumberOfPlayers
            let numberOfplayers =  try InputView.readPlayer()

            let game = Game.init(gameType, numberOfplayers)
            guard let cards = game.shareCards() else { throw CardError.noCardsRemaining }
            
            // Print
            OutputView.printCards(elements: cards)
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
