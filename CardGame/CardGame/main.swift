//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var play = true

while play {
    do {
        try CardGame.playGame()
    } catch CardError.inputError {
        print(CardError.inputError.rawValue)
        print()
    } catch CardError.inputNil {
        print(CardError.inputNil.rawValue)
        print()
    } catch CardError.noCardsRemaining {
        print(CardError.noCardsRemaining.rawValue)
        print()
    } catch {
        print(CardError.unknown.rawValue)
        print()
    }
}
