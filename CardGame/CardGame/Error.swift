//
//  File.swift
//  CardGame
//
//  Created by 김장수 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum Error {
    case invalidStud
    
    var description: String {
        switch self {
        case .invalidStud:
            return "카드 스택이 생성되지 않았습니다."
        }
    }
}
