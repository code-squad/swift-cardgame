//
//  InputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    enum GameMenu: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case quitGame = "q"
        case wrongInput
    }
    
    func select(rawValue: String) -> GameMenu {
        if let inputMenu = GameMenu(rawValue: rawValue) {
            return inputMenu
        }
        else {
            return .wrongInput
        }
    }
    
    func askUserInput(text: String) -> String {
        print(text)
        let userInput = readLine()
        guard let input = userInput else {
            return ""
        }
        return input
    }

    


}
