//
//  Error.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

// 에러 저장
enum CardGaemError: Error {
    case isNil
    case isOrder
    
    var description : String {
        switch self {
            case .isNil:
                return CARDGAME_ISNIL_ERROR_MSG
            case .isOrder:
                return CARDGAME_ISORDER_ERROR_MSG
        }
    }
}
