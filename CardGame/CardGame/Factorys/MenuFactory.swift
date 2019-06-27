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
        var menu: Menu?
        
        switch input {
        case 1:
            menu = createReset()
        case 2:
            menu = createShuffle()
        case 3:
            menu = createDraw()
        default:
            ()
        }
        return menu
    }
    
    static private func createReset() -> Menu {
        return Reset.init()
    }
    
    static private func createShuffle() -> Menu {
        return Shuffle.init()
    }
    
    static private func createDraw() -> Menu {
         return Draw.init()
    }
    
}
