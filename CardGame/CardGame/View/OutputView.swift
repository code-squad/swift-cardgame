//
//  OutputView.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printDealtCards(of players: [Player]) {
        for player in players {
            print(player)
        }
        print() //for new line
    }
}
