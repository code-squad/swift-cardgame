//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

/*
 데이터 타입 : 저장되는값 -> 전달값
 CardProperty : String -> UnicodeScalar
 Card : UnicodeScalar -> String
 */

func playGame() {
    do {
        let card = Card.init()
        try OutputView.printCard(card)
    } catch CardError.cardNotFound {
        print(CardError.cardNotFound.rawValue)
    } catch {
        print(CardError.unknown.rawValue)
    }
}

playGame()
