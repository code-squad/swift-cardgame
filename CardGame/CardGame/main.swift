//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

enum CardGameError : Error {
    case invalidMenumNumber
    case emptyCardDeck
}

func inputValueValidator(userInput: String) throws -> Int {
    // pasing
    let choiceTrimmed = userInput.filter { !$0.isNewline && !$0.isWhitespace }
    guard let choosenMenu = Int(choiceTrimmed) else {
        throw CardGameError.invalidMenumNumber
    }
    
    guard choosenMenu >= 1 && choosenMenu <= 3 else {
        throw CardGameError.invalidMenumNumber
    }
    
    return choosenMenu
}

func main() {
    let cardGameInput = CardGameInput()
    let cardDeck = CardDeck()
    
    do {
        while true {
            let userInput = InputView.readChoice(inputReadable: cardGameInput)
            let choosenMenu = try inputValueValidator(userInput: userInput)
            try OutputView.showResult(choosenMenu: choosenMenu, cardDeck: cardDeck)
        }
    }
    catch let error {
        print(error)
    }

}

main()







