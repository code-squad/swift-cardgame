//
//  ResultShowable.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol ResultShowable {
    mutating func makeResult(of: MenuItem) -> String
}

extension CardDeck: ResultShowable {

    mutating func makeResult(of menu: MenuItem) -> String {
        switch menu {
        case .reset:
            reset()
            return "카드 전체를 초기화했습니다."
        case .shuffle:
            shuffle()
            return "전체 \(self.count())장의 카드를 섞었습니다."
        case .draw:
            let card = removeOne()
            return "\(card)\n총 \(self.count())장의 카드가 남아있습니다."
        }
    }

}
