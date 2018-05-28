//
//  OutputView.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 출력을 담당하는 객체
struct OutputView {
    
    // static을 선언 이유 : OutputView를 객체 생성하지 않고 바로 showCard함수를 실행하기 위하여 선언
    
    static func showCard(_ card: Card) {
        print(card.desription())
    }
    
    // 시작 시 실행 선택하는 메시지
    static func cardGameSelectMassgae() {
        print(CARDGAME.MENU.ASK.desription)
        print(CARDGAME.MENU.RESET.desription)
        print(CARDGAME.MENU.SHUFFLE.desription)
        print(CARDGAME.MENU.DRAW.desription)
    }
    
    // 에러 메시지를 출력 하는 함수
    static func errorMessage(_ e : CardGaemError) {
        print(e.description)
    }
    
    // 딜러가 결과 값을 말하는 함수
    static func deelerMessage(_ dealer: DeckStateAsk) {
        print(dealer.answer())
    }
    
    // 딜러가 필드의 카드를 말하는 함수
    static func showFieldCard(_ dealer: CardStackStateAsk) {
        dealer.fieldCardAsk { (cardStack) in
            print(cardStack.description)
        }
    }
    
}
