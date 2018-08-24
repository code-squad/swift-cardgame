//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func playGame() throws {
    let inputValue = InputView.readInput()
    
    // 입력값 비어있는지 확인
    guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
    
    guard let action = Int(input) else { throw CardError.inputError }
    
    do {
        try CardDeck.act(action)
    } catch CardError.noCardsRemaining {
        throw CardError.noCardsRemaining
    } catch {
        throw CardError.inputError
    }
}

var play = true

while play {
    do {
        try playGame()
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
