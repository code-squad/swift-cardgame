//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func playGame() {
    do {
        let numbers = CardNumber.allCases
        let number = numbers[CardNumber.randomIndex]
        
        let shapes = CardShape.allCases
        let shape = shapes[CardShape.randomIndex]
        
        let card = Card.init(number: number, shape: shape)
        try OutputView.printCard(card)
    } catch CardError.cardNotFound {
        print(CardError.cardNotFound.rawValue)
    } catch {
        print(CardError.unknown.rawValue)
    }
}

playGame()
