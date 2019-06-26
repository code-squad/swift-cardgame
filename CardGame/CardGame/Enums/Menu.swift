//
//  Menu.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int, CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .reset:
            return "1. 카드 초기화"
        case .shuffle:
            return "2. 카드 섞기"
        case .draw:
            return "3. 카드 하나 뽑기"
        case .exit:
            return "4. 게임 종료"
        }
    }
    
    case reset = 1
    case shuffle
    case draw
    case exit
}

