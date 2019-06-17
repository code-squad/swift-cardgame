//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    static func start() throws {
        let cardGame = CardGamePlay()
        try cardGame.playGame()
        
    }
}

try Main.start()
