//
//  CardDeckPlay.swift
//  CardGame
//
//  Created by hw on 15/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CardDeckPlay {
    static func startGame() throws -> Void{
        let cardDeck : CardDeck = CardDeck.init()
        var drawCard : Card = Card(type: CardType.spade, number: CardNumber.ace)
        var input: String
        var convertedNumber: GameMenu = .initialization
        
        /// start
        while true {
            /// 입력
            InputView.introduce()
            do {
                input = try InputView.readInput()
                convertedNumber = try Validation.validateGameMenu(input)
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
            /// 처리
            let card = try handleInstruction(menuNumber: convertedNumber, cardDeck: cardDeck, drawCard: drawCard)
            ///출력
            printMessage(menuNumber: convertedNumber, cardDeck: cardDeck, drawCard: card)
        }
    }
    
    private static func handleInstruction (menuNumber: GameMenu, cardDeck: CardDeck, drawCard: Card) throws -> Card{
        switch menuNumber {
        case .initialization:
            cardDeck.reset()
        case .shuffle:
            cardDeck.shuffle()
        case .drawOne:
            do {
                return try cardDeck.removeOne().get()
            } catch let drawError as DrawCardError {
                print(drawError.description)
                OutputView.displayDrawCardErrorAutoHandleMessage()
                cardDeck.reset()
            }
        }
        return drawCard
    }
    
    private static func printMessage(menuNumber: GameMenu, cardDeck: CardDeck, drawCard: Card){
        switch menuNumber {
        case .initialization:
            OutputView.displayMenuResult(.initialization, deck: cardDeck)
        case .shuffle:
            OutputView.displayMenuResult(.shuffle, deck: cardDeck)
        case .drawOne:
            OutputView.printCard(drawCard)
            OutputView.displayMenuResult(.drawOne, deck: cardDeck)
        }
    }
}
