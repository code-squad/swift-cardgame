//
//  OutputView.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static let sharp = "#"
    static func printPlayers(using playerPrinter: PlayerPrintable) {
        let nameCardsPairs = playerPrinter.getNameCardsPairs()
        for (name, cards) in nameCardsPairs {
            print(name, cards)
        }
        print() //for new line
    }
    
    static func announce(nameOfWinner: String) {
        print("이번 게임의 승자는 \(nameOfWinner) 입니다.")
    }
}
