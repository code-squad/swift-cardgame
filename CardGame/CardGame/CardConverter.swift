//
//  CardConverter.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//상속을 할 일이 없으므로 struct 를 사용함
struct CardConverter {
    
    static func getCardString(number: Card.Number) -> String {
        switch number {
        case .one:
            return "A"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        default:
            return "\(number.rawValue)"
        }
    }
}
