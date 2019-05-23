//
//  MenuChecker.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuChecker {
    static func checkMenu (_ input: String) throws -> Menu {
        guard let menu = Menu(rawValue: Int(input) ?? 0) else {
            throw InputError.notExistsMenu
        }
        
        return menu
    }
}
