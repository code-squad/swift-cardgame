//
//  Menu.swift
//  CardGame
//
//  Created by Daheen Lee on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 메뉴 선택 숫자 -> 케이스로 변환
enum Menu: Int {
    case exit = 0, sevenCardStud, fiveCardStud
    
    init(selection: String) {
        let convertedSelection = Int(selection) ?? 0
        self = Menu(rawValue: convertedSelection) ?? .exit
    }
    
    var numberOfCards: Int {
        switch self {
        case .sevenCardStud:
            return 7
        case .fiveCardStud:
            return 5
        default:
            return 0
        }
    }
}
