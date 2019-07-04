//
//  InputView.swift
//  CardGame
//
//  Created by JieunKim on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Direction: String {
    case request = "다음 메뉴를 선택해주세요"
}

struct InputView {
    static func ask(for direction: Direction) throws -> String {
        print(direction.rawValue)
        guard let data = readLine() else {
            throw CardGameError.wrongValue
        }
        return data
    }
}
