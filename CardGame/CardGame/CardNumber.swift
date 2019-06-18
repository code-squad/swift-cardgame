//
//  CardNumber.swift
//  CardGame
//
//  Created by jang gukjin on 17/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
// enum을 선택한 이유: 다양한 속성 중 특정한 속성 하나를 뽑기 편한것 같아서
enum CardNumber: Int, CaseIterable {
    case one = 1
    case two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    
    var description: String {
        switch self {
        case .one: return "A"
        case .eleven: return "J"
        case .twelve: return "Q"
        case .thirteen: return "K"
        default: return "\(self.rawValue)"
        }
    }
}
