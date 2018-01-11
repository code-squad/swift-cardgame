//
//  InputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    func askUserInput(text: String) -> String {
        print(text)
        let userInput = readLine()
        guard let input = userInput else {
            return ""
        }
        return input
    }
}
