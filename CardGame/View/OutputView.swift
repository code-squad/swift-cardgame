//
//  OutputView.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printResult(menuNumber: String, inputNumber: Int, card: Card?) {
        if card != nil {
            (card)!.printCard()
        }
        if menuNumber == "2" {
            print("총 \(inputNumber)장의 카드를 섞었습니다.")
        } else {
            print("총 \(inputNumber)장의 카드가 남아있습니다")
        }
    }
}
