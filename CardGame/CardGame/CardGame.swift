//
/******************************************************************************
 * File Name        : CardGame.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

class CardGame {
    private let cardDeck = CardDeck()
    private let inputView = InputView()

    public init() {
        
    }
    
    public func playGame(numberOfTimes number: Int) {
        
        for _ in 1 ... number {
            playOneTurn()
        }
        
    }
    
    public func playOneTurn() {
        inputView.printMenu()
        guard let inputedMenu = inputView.readUserInput() else {
            return
        }
        
        switch inputedMenu {
        case .reset:
            cardDeck.reset()
        case .suffle:
            cardDeck.shuffle()
        case .pickOne:
            if let card = cardDeck.removeOne() {
                print(card.description)
            }
        case .unknown:
            break
        }
        
        let resultText = inputedMenu.resultText(cardCount: cardDeck.count())
        print(resultText)
        print()
    }
    
}
