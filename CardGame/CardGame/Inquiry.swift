//
//  Question.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Inquiry: Int {
    case reset = 1
    case shuffle
    case pickOne
    
    var selection: String {
        switch self {
        case .reset:
            return "\(rawValue). 카드 초기화"
        case .shuffle:
            return "\(rawValue). 카드 섞기"
        case .pickOne:
            return "\(rawValue). 카드 하나 뽑기"
        }
    }
    
    static let allCases: [Inquiry] = [.reset, .shuffle, .pickOne]
}
