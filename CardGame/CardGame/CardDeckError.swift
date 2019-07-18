//
//  CardDeckError.swift
//  CardGame
//
//  Created by 이진영 on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardDeckError: Error {
    case cardDeckEmpty
    
    var localizedDescription: String {
        switch self {
        case .cardDeckEmpty:
            return "카드 덱이 비어있습니다."
        }
    }
}
