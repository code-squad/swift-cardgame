//
//  OutputView.swift
//  CardGame
//
//  Created by JieunKim on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func printPlayers(game: OutputViewPrintable) {
        game.printPlayerInfo { name, cards in
            print("\(name) \(cards)")
        }
    }
    
        static func printError(_ description: String) {
            print(description)
        }
}

