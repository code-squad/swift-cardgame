//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ menu: Menu, _ result: (cardReturned: Card?, cardCount: Int)) {
        switch menu {
        case .reset: print("카드 전체를 초기화했습니다.\n총 \(result.cardCount)장의 카드가 있습니다.")
        case .shuffle: print("전체 \(result.cardCount) 장의 카드를 섞었습니다.")
        case .removeOne:
            if let card = result.cardReturned {
                print("\(String(describing: card))\n총 \(result.cardCount)장의 카드가 남아있습니다.")
            }
        }
    }
}
