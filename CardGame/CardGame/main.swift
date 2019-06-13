//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    
    static func startGame() throws -> Void{
        /// 초기 세팅
        var cardDeck : CardDeck = CardDeck.init()
        var drawCard : Card = Card(type: CardType.spade, number: CardNumber.ace)
        var input: String
        var convertedNumber: GameMenu = .initialization
        
        /// start
        while true {
            /// 입력
            InputView.introduce()
            do {
                input = try InputView.readInput()
                convertedNumber = try Validation.validate(input)
            } catch let errorType as GameMenuError {
                print(errorType.description)
                continue
            }
            /// 처리
            try handleInstruction(menuNumber: convertedNumber, cardDeck: cardDeck, drawCard: &drawCard)
            ///출력
            printMessage(menuNumber: convertedNumber, cardDeck: cardDeck, drawCard: drawCard)
        }
    }
    
    private static func handleInstruction (menuNumber: GameMenu, cardDeck: CardDeck, drawCard: inout Card) throws {
        switch menuNumber {
        case .initialization:
            cardDeck.reset()
        case .shuffle:
            cardDeck.shuffle()
        case .drawOne:
            do {
                drawCard = try cardDeck.removeOne().get()
            } catch let drawError as DrawCardError {
                print(drawError.description)
                OutputView.displayDrawCardErrorAutoHandleMessage()
                cardDeck.reset()
            }
        }
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

try Main.startGame()
