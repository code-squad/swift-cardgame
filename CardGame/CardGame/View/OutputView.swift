//
//  OutputView.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {

    static func notifyError(_ error: GameInputError) {
        print(error.rawValue)
    }
    
    static func notifyEndOfGame() {
        let endMessage = "다음 게임을 진행하기에 카드가 부족합니다."
        print(endMessage)
    }
    
    static func showCards(of cardGame: CardGame){
        print(cardGame.showCards())
    }

}
