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
    
    // 카드
    
    switch input {
    case "1":
        // reset
        CardDeck.reset()
        CardDeck.countMessage()
    case "2":
        // shuffle
        CardDeck.shuffle()
    case "3":
        // removeOne
        print("3")
        CardDeck.countMessage()
    default:
        throw CardError.inputError
    }
    
    
}

var play = true

while play {
    do {
        try playGame()
    } catch CardError.inputError {
        print(CardError.inputError.rawValue)
    }  catch CardError.inputNil {
        print(CardError.inputNil.rawValue)
    } catch {
        print(CardError.unknown.rawValue)
    }
}
