//
//  GameMenu.swift
//  CardGame
//
//  Created by 이진영 on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenu: Int, CustomStringConvertible {
    case exit = 0, sevenCardStud, fiveCardStud
    
    init(_ selectionResult: Int) {
        self = GameMenu(rawValue: selectionResult) ?? .exit
    }
    
    var description: String {
        switch self {
        case .exit:
            return "선택지가 아닌 값 입력 시 프로그램 종료"
        case .sevenCardStud:
            return "\(rawValue). 7카드"
        case .fiveCardStud:
            return "\(rawValue). 5카드"
        }
    }
}
