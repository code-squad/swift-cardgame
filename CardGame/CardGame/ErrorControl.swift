//
//  ErrorControl.swift
//  CardGame
//
//  Created by JieunKim on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CardGameError: Error {
    case wrongValue
    
    var localizedDescription: String {
        switch self {
        case .wrongValue:
            return "잘못된 값이 입력되었습니다."
        }
    }
}
