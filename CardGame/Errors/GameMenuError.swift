//
//  GameMenuError.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum GameMenuError : Error, CustomStringConvertible{
    case notANumber
    case outOfRange
    
    var description: String {
        switch self{
        case .notANumber:
            return "입력값이 숫자가 아닙니다."
        case .outOfRange:
            return "입력값이 메뉴 선택범위 밖입니다."
        }
    }
    
}
