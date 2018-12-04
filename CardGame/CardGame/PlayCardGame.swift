//
//  PlayCardGame.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct PlayCardGame {
    static func playGame() {
        let input = InputView.inputUser(message: "다음 메뉴를 선택해주세요.")
        let card = Card(shape: .diamond, number: .one)
        print(card)
    }
}
