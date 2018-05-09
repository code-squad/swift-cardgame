//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    
    var cardDeck: CardDeckable = CardDeck()
    do {
        while true {
            let input: Int = Int(InputView.readInput(question: Question.menu)) ?? 0
            try OutputView.printResult(cardDeck: &cardDeck, menu: input)
        }
    } catch let error as OutputView.Error {
        print(error.errorMessage)
    } catch {
        fatalError("Unexpected Error")
    }
    
}

main()
