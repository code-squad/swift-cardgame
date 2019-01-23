//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

// 숫자와 모양을 랜덤으로 생성해주는 함수
func createRandomCard() -> Card {
    let number = Number.allCases.randomElement() ?? .ace
    let shape = Shape.allCases.randomElement() ?? .spades
    return Card(number: number, shape: shape)
}

// 만들고 -> 출력
func main() {
    let card = createRandomCard()
    OutputView.output(card)
}

main()
