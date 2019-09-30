//
//  CardGameView.swift
//  CardGame
//
//  Created by RENO1 on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGameViewImpl: CardGameView {
    private let MENU_TITLE = "다음 메뉴를 선택해주세요."
    private let menus = ["1. 카드 초기화","2. 카드 섞기","3. 카드 하나 뽑기"]
    
    func showTotalCardCount(totalCount: Int) {
        print("총 \(totalCount)장의 카드가 있습니다.\n")
    }
    
    func showInitMessage(initCount: Int) {
        print("카드 전체를 초기화했습니다.")
        print("총 \(initCount)장의 카드가 있습니다.")
    }
    
    func showShuffleMessage(totalCount: Int) {
        print("전체 \(totalCount)장의 카드를 섞었습니다.")
    }
    
    func showSelectCard(selectCard: Card) {
        print(selectCard.description)
    }
    
    func showCardError(error:CardError) {
        print(error.rawValue)
    }
    
    func showMenu() {
        print(MENU_TITLE)
        for menu in menus {
            print(menu)
        }
    }
}

protocol CardGameView {
    func showTotalCardCount(totalCount: Int)
    func showInitMessage(initCount: Int)
    func showShuffleMessage(totalCount: Int)
    func showSelectCard(selectCard: Card)
    func showCardError(error:CardError)
    func showMenu()
}

enum Menu:Int, CaseIterable {
    case INIT = 0
    case SHUFFLE = 1
    case SELECT = 2
}

enum CardError: String, Error {
    case NO_CARD = "더 이상 카드가 없습니다."
    case UNKNOWN = "알 수 없는 에러입니다."
}
