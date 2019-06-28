//
//  Exception.swift
//  CardGame
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum InputException: LocalizedError {
    case wrongFormat
    case unsupportedMenu
    
    var errorDescription: String? {
        switch self {
        case .wrongFormat:
            return "잘못된 입력입니다."
        case .unsupportedMenu:
            return "지원하지 않는 메뉴입니다"
        }
    }
}


