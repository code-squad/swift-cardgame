//
//  MenuController.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct MenuController {
    
    private static func makeInt(str: String) -> Int? {
        return Int(str)
    }

    private static func makeMenu(at num: Int) -> MenuItem? {
        return MenuItem(rawValue: num)
    }

    static func getMenu(of stringSelected: String) -> MenuItem? {
        guard let numSelected = makeInt(str: stringSelected) else {
            OutputView.notifyError(.notInt)
            return nil
        }
        guard let menuSelected = makeMenu(at: numSelected) else {
            OutputView.notifyError(.outOfMenu)
            return nil
        }
        return menuSelected
    }
    
    
}
