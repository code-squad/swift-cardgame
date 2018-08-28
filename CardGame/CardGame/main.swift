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
            guard let inputGameType = InputView.readGameType() else { throw CardError.inputNil }
            guard let gameType = GameType.init(rawValue: inputGameType) else { throw CardError.inputRangeExceeded }

            // NumberOfPlayers
            guard let inputPlayer = InputView.readPlayer() else { throw CardError.inputNil }
            guard let numberOfplayers = NumberOfPlayers.init(rawValue: inputPlayer) else { throw CardError.inputRangeExceeded }

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
