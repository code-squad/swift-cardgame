//
//  DrawCardError.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum DrawCardError : Error, CustomStringConvertible {
    case noMoreCardInDeck
    var description: String {
        switch self {
        case .noMoreCardInDeck:
            return "카드 덱에 카드가 더이상 없습니다."
        }
    }
}
