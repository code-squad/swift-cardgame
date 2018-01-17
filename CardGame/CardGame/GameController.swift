//
//  GameController.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct GameController {
    private (set) var studType: Int
    private (set) var numberOfPlayer: Int
    let inputView = GameInputView()

    /*
     상위 모듈에서 GameController객체가 nil이 되면
     게임 진행이 되지 않도록 init? 설정
     */

    init?(stud: GameInputView.CardStudMenu,
          numberOfPlayer: Int?) {
        // setting stud
        switch stud {
        case .one:
            self.studType = 7
        case .two:
            self.studType = 5
        case .quitGame:
            return nil // 게임 종료 메시지
        case .wrongInput:
            return nil // 잘못된 값 입력 메시지
        }

        // setting numberOfPlayer
        guard let number = numberOfPlayer else {
            return nil
        }
        if number >= 0 && number <= 4 {
            self.numberOfPlayer = number
        } else {
            return nil
        }

    }

    func hasEnoughCards(numberOfCard: Int) -> Bool {
        if ((self.numberOfPlayer+1) * self.studType) > numberOfCard {
            return false
        } else {
            return true
        }
    }


}

