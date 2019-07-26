//
//  CardPattern.swift
//  CardGame
//
//  Created by JH on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
//카드의 패턴이 제한적이어서 enum으로 정의함. 외부에 만들면 관리하기 더 좋을거 같아서 따로 파일을 만들어줌.
enum CardPattern: CustomStringConvertible, CaseIterable {
    
    case heart
    case diamond
    case clover
    case spade
    
    var description: String {
        switch self {
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .clover:
            return "♣️"
        case .spade:
            return "♠️"
        }
    }

}



