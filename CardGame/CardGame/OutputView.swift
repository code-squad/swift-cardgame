//
//  OutputView.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    // 사용자 카드패를 출력
    static func printPlayerCards(with players: PlayersPrintable, of playersCount: Int) {
        for number in 0..<playersCount {
            players.iterate(at: number) {
                (name, cards) in
                print(name, cards)
            }
        }
    }
}


