//
//  CardError.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum CardError:String , Error {
    case cardNotFound = "카드를 찾을 수 없습니다."
    case unknown = "알 수 없는 에러가 발생하였습니다."
    case inputError = "잘못 입력하셨습니다."
    case inputNil = "입력값이 비어있습니다."
}
