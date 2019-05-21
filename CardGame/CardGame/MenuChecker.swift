//
//  MenuChecker.swift
//  CardGame
//
//  Created by joon-ho kil on 5/21/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuChecker {
    static func checkMenu (_ input: String) throws -> Int {
        guard let menu = Int(input), menu < 4 && menu > 0 else {
            throw InputError.notExistsMenu
        }
        
        return menu
    }
}
