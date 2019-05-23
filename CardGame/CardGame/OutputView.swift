//
//  OutputView.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printMessage (_ menu: Menu, cardReturned: Card?, _ cardCount: Int) {
        switch menu {
        case .reset: print("카드 전체를 초기화했습니다.\n총 \(cardCount)장의 카드가 있습니다.")
        case .shuffle: print("전체 \(cardCount) 장의 카드를 섞었습니다.")
        case .removeOne: print("\(String(describing: cardReturned))\n총 \(cardCount)장의 카드가 남아있습니다.")
        }
    }
}
