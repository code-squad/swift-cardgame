//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    public static func printCards(game : Game) {
        print(game.description)
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
