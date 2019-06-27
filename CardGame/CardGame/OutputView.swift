//
//  OutputView.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static let doubleNewLine = "\n\n"
    
    static func printCompletionOfReset(count: Int) {
        print("카드 전체를 초기화했습니다. ")
        print("총 \(count)개의 카드가 있습니다.", terminator: doubleNewLine)
    }
    
    static func printCompletionOfShuffle(count: Int) {
        print("전체 \(count)장의 카드를 섞었습니다.", terminator: doubleNewLine)
    }
    
    static func printCompletionOfRemove(card: Card, remainingCount: Int) {
        print(card)
        print("총 \(remainingCount)개의 카드가 남았습니다.", terminator: doubleNewLine)
    }
}
