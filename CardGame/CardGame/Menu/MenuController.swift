//
//  MenuController.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct MenuController {

    static func getMenu(of stringSelected: String) -> MenuItem? {
        guard let numSelected = Int(stringSelected) else {
            OutputView.notify(error: GameInputError.notInt)
            return nil
        }
        guard let menuSelected = MenuItem(rawValue: numSelected) else {
            OutputView.notify(error: GameInputError.notMenuSupported)
            return nil
        }
        return menuSelected
    }

}
