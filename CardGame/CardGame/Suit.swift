//
//  Suit.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

// 이 데이터 구조를 선택한 이유:
// enum을 사용하면, 카드의 suit 속성으로 가질 수 있는 값의 경우를 보다 직관적으로 볼 수 있기 때문입니다.
// 또한, 역으로 rawValue를 활용해 Suit 타입 값을 지정할 수 있어 임의의 타입값을 할당해주기에도 용이할 것이라고 생각했습니다.

enum Suit: Int {
    case spades = 1, hearts, diamonds, clubs

    var value: Character {
        switch self {
        case .spades:
            return "♠️"
        case .hearts:
            return "♥️"
        case .diamonds:
            return "♦️"
        case .clubs:
            return "♣️"
        }
    }
}
