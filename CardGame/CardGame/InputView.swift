//
//  InputView.swift
//  CardGame
//
//  Created by jack on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum GameMenu : Int, generateAllCases {
        case sevenCards = 1
        case fiveCards = 2
    }
    
    enum NumberOfPlayers : Int, generateAllCases {
        case onePlayer = 1
        case twoPlayer = 2
        case threePlayer = 3
        case fourPlayer = 4
    }
    
    func readOneMenu() -> Int {
        return Int(readLine() ?? "") ?? 0
    }
    
    func isPossibleGameMenu(_ userInput : Int) -> Bool {
        return GameMenu.allCases.map({$0.rawValue}).contains(userInput)
    }
    
    func isPossiblePlayers(_ userInput : Int) -> Bool {
        return NumberOfPlayers.allCases.map({$0.rawValue}).contains(userInput)
    }
}
