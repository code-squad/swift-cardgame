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
    
    var description : String {
        switch self {
            case .isNil:
                return "선택한 값이 없습니다."
        }
    }
}
