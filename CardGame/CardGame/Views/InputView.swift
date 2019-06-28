//
//  InputView.swift
//  CardGame
//
//  Created by CHOMINJI on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private static let guideSentences = "다음 메뉴를 선택해주세요"
    
    static func menuNumber() -> Int? {
        print(guideSentences)
        for category in DeckMenu.allCases {
            print(category)
        }
        let input = readInput()
        return Int(input) ?? 0
    }
    
    private static func readInput() -> String {
        let inputSymbol = ">"
        print(inputSymbol, terminator: " ")
        let input = readLine() ?? ""
        return input
    } 
}
