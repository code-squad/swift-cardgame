//
//  MenuFactory.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuFactory: Factory {
    typealias IN = Int
    
    typealias OUT = Menu
    
    static func create(_ input: Int) -> Menu? {
        
        switch input {
        case 1:
            return Reset.init()
        case 2:
            return Shuffle.init()
        case 3:
            return Draw.init()
        default:
            return nil
        }
    }
}
