//
//  InputView.swift
//  CardGame
//
//  Created by Elena on 24/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {

    static func readInput(ment: String , menu: String) -> String {
        print(ment)
        print(menu)
        return readLine() ?? ""
    }

    static func getCardGameStart() -> String {
        let menu = Menu.allCases
            .map { "\($0.rawValue). \($0.menuPrint)" }
            .joined(separator: "\n")
        let cardGameStart = InputView.readInput(ment: "다음 메뉴를 선택해주세요.",menu: menu)
        return cardGameStart
    }

}
