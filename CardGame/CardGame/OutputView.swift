//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    public static func printCards(game : GamePrintable) {
        game.printPlayerCards { print("\($0)") }
    }
    
    public static func printWinner(game : GamePrintable) {
        print()
        game.printWinner { print("우승자 \($0) : \($0.hands().0) 핸즈로 우승!") }
        print()
    }
    
    public static func printError(error:Error) {
        if let inputError = error as? InputError {
            print(inputError.description)
        }
        if let cardError = error as? CardError {
            print(cardError.description)
        }
        print()
    }
}
