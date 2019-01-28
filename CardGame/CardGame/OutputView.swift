//
//  OutputView.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {

    enum Error: String {
        case notMenu = "메뉴의 내용이 아닙니다. \n"
    }
    
    static func errorResult(_ error: Error) {
        print(error.rawValue)
    }
    // Overloading
    static func output(_ card: Card) {
        print(card)
    }
    // Overloading
    static func output(_ result: String) {
        print(result)
    }
}
