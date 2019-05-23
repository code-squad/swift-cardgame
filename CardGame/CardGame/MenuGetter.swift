//
//  MenuGetter.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuGetter {
    func getMenu(_ inputView: InputView) throws -> Menu {
        inputView.printMenu()
        let input = inputView.readInput()
        let menu = try MenuChecker.checkMenu(input)
        
        return menu
    }
}

