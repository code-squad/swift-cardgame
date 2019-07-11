//
//  CardNumber.swift
//  CardGame
//
//  Created by JH on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
//카드의 패턴과 동일함. 특정한 경우말고는 매칭되는 숫자를 출력해줘야 하기 때문에 rawValue로 Int를 넣어줌.
enum CardNumber: Int, CustomStringConvertible {
    
    case one = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case eleven
    case twelve
    case thirteen
    
    var description: String {
        switch self {
        case .one:
            return "A"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        default :
            return "\(self.rawValue)"
        }
    }
}
