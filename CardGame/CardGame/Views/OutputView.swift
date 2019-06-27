//
//  OutputView.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func showResult (_ result: GameResult) {
        let printOut = makePrintOut(result)
        print(printOut)
    }
    
    static private func makePrintOut(_ result: GameResult) -> String {
        var printOut: String
        
        switch result {
        case .reset(let remain):
            printOut = "카드 전체를 초기화했습니다.\n총 \(remain)장의 카드가 있습니다."
        case .shuffle(let remain):
            printOut = "전체 \(remain)장의 카드를 섞었습니다."
        case .draw(let card, let remain):
            let description = card?.description ?? "뽑힌 카드가 없습니다."
            printOut = "\(description)\n총 \(remain)장의 카드가 남아있습니다."
        }
        return printOut
    }
}
