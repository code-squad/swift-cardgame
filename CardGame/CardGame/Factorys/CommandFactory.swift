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
    typealias OUT = Command
    
    static func create(_ input: Int) -> Command? {
        var menu: Command?
        
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
    
    static private func createReset() -> Command {
        return Reset.init()
    }
    
    static private func createShuffle() -> Command {
        return Shuffle.init()
    }
    
    static private func createDraw() -> Command {
         return Draw.init()
    }
    
}
