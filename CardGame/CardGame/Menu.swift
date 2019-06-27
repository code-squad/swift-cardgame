//
//  Menu.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int {
    case exit = 0, reset, shuffle, remove
    
    init(selection: Int) {
        self = Menu(rawValue: selection) ?? .exit
    }
}
