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
    case sevenCardStud = 1, fiveCardStud
    
    init?(selection: String) {
        let convertedSelection = Int(selection) ?? 0
        guard let menu = Menu(rawValue: convertedSelection) else {
            return nil
        }
        self = menu
    }
    
    var numberOfCards: Int {
        switch self {
        case .sevenCardStud:
            return 7
        case .fiveCardStud:
            return 5
        }
    }
}
