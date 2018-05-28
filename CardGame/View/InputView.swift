//
//  InputView.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

struct InputView {
    
    // readInput : 사용자에게 값을 입력 받기 위한 함수
    static func order() throws -> CARDGAME.MENU? {
        guard let readInput = readLine() else {
            throw CardGaemError.isNil
        }
        return CARDGAME.MENU.init(rawValue: readInput)
    }
}
