//
//  GameInputview.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGameInput : InputReadable {
    
    func read(message: Menu) -> String {
        print(message)
        print("> ", terminator: "")
        let choice = readLine() ?? ""
        return choice
    }
}
