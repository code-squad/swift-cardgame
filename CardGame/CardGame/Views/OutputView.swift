//
//  OutputView.swift
//  CardGame
//
//  Created by 이진영 on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResult(of result: GameResult) {
        switch result {
        case .reset(let count):
            print("카드 전체를 초기화했습니다.")
            print("총 \(count)장의 카드가 있습니다.")
        case .shuffle(let count):
            print("전체 \(count)장의 카드를 섞었습니다.")
        case .draw(let card, let count):
            print(card)
            print("총 \(count)장의 카드가 남아있습니다.")
        case .exit:
            print("프로그램 종료")
        }
    }
}
