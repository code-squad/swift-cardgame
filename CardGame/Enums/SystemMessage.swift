//
//  SystemMessage.swift
//  CardGame
//
//  Created by hw on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum SystemMessage: CustomStringConvertible{
    case autoInitializeDeck
    case gameWinner(String, String)
    var description : String {
        switch  self {
        case .autoInitializeDeck:
            return "잔여카드가 없으므로 카드덱을 초기화합니다."
        case .gameWinner(let winner, let type):
            return "이번게임의 승자는 \(winner) 입니다. [\(type)]로 승리"
        }
    }
}
