//
//  ErrorMessage.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case notInt = "숫자를 입력해주세요"
    case outOfRange = "메뉴에 나와있는 숫자를 입력해주세요"
}
