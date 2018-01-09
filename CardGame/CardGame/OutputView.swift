//
//  OutputView.swift
//  CardGame
//
//  Created by jack on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    enum Messages : String {
        case inputMessage = "다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n4. 종료"
        case resetMessage = "카드 전체를 초기화했습니다.\n총 52장의 카드가 있습니다."
        case invalidMenu = "잘못된 메뉴입니다. 다시 입력해주세요."
        case exitCardGame = "카드게임을 종료하겠습니다."
    }
    
    func printMessage (_ oneMessage : Messages) {
        print(oneMessage.rawValue)
    }
    
    func printRemaingCards(_ userDeck : CardDeck) {
        print("총 \(userDeck.count())장의 카드가 남아있습니다.")
    }
    
    func printShuffleMessage(_ userDeck : CardDeck) {
        print("전체 \(userDeck.count())장의 카드를 섞었습니다.")
    }

}
