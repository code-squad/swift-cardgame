//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() throws {
    var game = CardGame()
    while true {
        guard let menuNumber = InputView.getMenuNumber() else {
           throw Exception.wrongFormat
        }
        guard let menu = MenuFactory.create(menuNumber) else {
             throw Exception.unsupportedMenu
        }
        let result = game.run(menu: menu)
        OutputView.showResult(result)
    }
}


do {
    try main()
}catch {
    print(error.localizedDescription)
}
