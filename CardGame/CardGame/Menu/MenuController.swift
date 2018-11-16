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
            OutputView.notifyError(.notInt)
            return nil
        }
        guard let menuSelected = MenuItem(rawValue: numSelected) else {
            OutputView.notifyError(.notMenuSupported)
            return nil
        }
        return menuSelected
    }

}
