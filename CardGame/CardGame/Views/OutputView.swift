//
//  OutputView.swift
//  CardGame
//
//  Created by 이진영 on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResult(of game: CardGame) {
        game.printPlayerInformation { print("\($0) \($1)")}
        game.printWinner { print("이번 게임의 승자는 \($0) 입니다.") }
    }
}
