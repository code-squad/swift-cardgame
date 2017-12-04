//
//  ErrorMsg.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

enum ErrorMsg: String, Error {
    case invaildInput = "입력값을 확인해 주세요."
    case zeroCard = "마지막 카드를 다 쓰셨습니다! 새로운 덱을 가져오세요."
}
