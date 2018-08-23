//
//  CardGameError.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CardGameError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidMenu:
            return "올바르지 않은 메뉴입니다."
        case .unknown:
            return "예상치 못한 에러가 발생하였습니다."
        }
    }
    case invalidMenu
    case unknown
}
