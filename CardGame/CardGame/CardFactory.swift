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

/*
 count() 갖고 있는 카드 개수를 반환한다.
 shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
 removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
 reset() 처음처럼 모든 카드를 다시 채워넣는다.
 */
