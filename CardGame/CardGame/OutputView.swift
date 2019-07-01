//
//  OutputView.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func printGameResult(result: GameResult) {
        switch result {
        case .initialize(let count):
            print("카드 전체를 초기화했습니다.\n총 \(count)장의 카드가 있습니다.")
        case .shuffle(let count):
            print("전체 \(count)장의 카드를 섞었습니다.")
        case .draw(let card, let count):
            print("\(card)\n총 \(count)장의 카드가 남아있습니다.")
        }
    }
}
