//
//  CardGameResult.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardGameResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .reset(let count):
            return """
            카드 전체를 초기화했습니다.
            총 \(count)장의 카드가 있습니다.
            """
        case .shuffle(let count):
            return "전체 \(count)장의 카드를 섞었습니다."
        case .pick(let card, let remains):
            return """
            \(card)
            총 \(remains)장의 카드가 남았습니다.
            """
        case .stack(let stack):
            return "\(stack)"
        }
    }
    
    case reset(Int)
    case shuffle(Int)
    case pick(Card, Int)
    case stack(CardStack)
}
