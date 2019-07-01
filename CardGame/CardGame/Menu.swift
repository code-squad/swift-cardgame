//
//  Menu.swift
//  CardGame
//
//  Created by 이진영 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int, CustomStringConvertible {
    case exit = 0, reset, shuffle, draw
    
    init(_ selectionResult: String) {
        let number = Int(selectionResult) ?? 0
        
        self = Menu(rawValue: number) ?? .exit
    }
    
    var description: String {
        switch self {
        case .exit:
            return "선택지가 아닌 값 입력 시 프로그램 종료"
        case .reset:
            return "\(rawValue). 카드 초기화"
        case .shuffle:
            return "\(rawValue). 카드 섞기"
        case .draw:
            return "\(rawValue). 카드 하나 뽑기"
        }
    }
}
