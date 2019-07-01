//
//  InputView.swift
//  CardGame
//
//  Created by CHOMINJI on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func menuNumber() -> Int? {
        print(GuideSentence.deckMenu)
        for category in DeckMenu.allCases {
            print(category)
        }
        let input = readInput()
        return Int(input) ?? 0
    }
    
    static func readInput() -> String {
        let inputSymbol = ">"
        print(inputSymbol, terminator: " ")
        let input = readLine() ?? ""
        return input
    } 
}
