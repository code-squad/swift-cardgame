//
//  GameResult.swift
//  CardGame
//
//  Created by BLU on 30/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameResult: CustomStringConvertible {
    case initialize(Int)
    case shuffle(Int)
    case draw(Card, Int)
    
    var description: String {
        switch self {
        case .initialize(let count):
            return "카드 전체를 초기화했습니다.\n총 \(count)장의 카드가 있습니다."
        case .shuffle(let count):
            return "전체 \(count)장의 카드를 섞었습니다."
        case .draw(let card, let count):
            return "\(card)\n총 \(count)장의 카드가 남아있습니다."
        }
    }
}
