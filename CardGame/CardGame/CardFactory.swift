//
//  CardFactory.swift
//  CardGame
//
//  Created by Elena on 24/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardFactory {
    // 숫자와 모양을 랜덤으로 생성해주는 함수
    static func createRandomCard() -> Card {
        let number = Number.allCases.randomElement() ?? .ace
        let shape = Shape.allCases.randomElement() ?? .spades
        return Card(number: number, shape: shape)
    }
    
}
