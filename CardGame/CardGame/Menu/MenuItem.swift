//
//  MenuItem.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MenuItem: Int, CaseIterable {
    case reset = 1, shuffle, draw
    case quit
    
    var message: String{
        switch self {
        case .reset:
            return "카드 초기화"
        case .shuffle:
            return "카드 섞기"
        case .draw:
            return "카드 하나 뽑기"
        case .quit:
            return "끝내기"
        }
    }
}
