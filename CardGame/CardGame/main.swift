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
        let result = try game.run(menuNumber: menuNumber)
        OutputView.showResult(result)
    }
}


do {
    try main()
}catch {
    print(error.localizedDescription)
}
