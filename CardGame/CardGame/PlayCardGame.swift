//
//  PlayCardGame.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct PlayCardGame {
    enum ChoiceMenu : String {
        case resetCard = "1"
        case shuffleCard = "2"
        case pickCard = "3"
    }
    
    // 게임을 실행
    static func playGame() {
        let cardDeck = CardDeck()
        var input : String
        repeat {
            input = InputView.inputUser(message: "다음 메뉴를 선택해주세요.")
        }while !checkMenu(of: input)
        executeByMenu(by: ChoiceMenu(rawValue: input), with: cardDeck)
    }
    
    // 메뉴에 있는 선택지인지 확인
    static private func checkMenu(of menu : String) -> Bool {
        guard menu == "1" || menu == "2" || menu == "3" else { return false }
        return true
    }
    
    // 메뉴에 따라 행동을 실행
    static private func executeByMenu(by menu : ChoiceMenu?, with cardDeck : CardDeck) {
        guard let menu = menu else { return }
        switch menu {
        case .pickCard:
            cardDeck.removeOne()
        case .resetCard:
            cardDeck.reset()
        case .shuffleCard:
            cardDeck.shuffle()
        }
    }
}
