//
//  OutputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    enum Messages {
        case menuMessage
        case resetMessage
        case shuffleMessage
        case removeOneMessage
    }
    
    func printMenu() {
        print("다음 메뉴를 선택해주세요. \n1. 카드 초기화 \n2. 카드 섞기 \n3. 카드 하나 뽑기")
    }
    
    func printReset(_ cardDect: CardDeck) {
        print("카드 전체를 초기화했습니다. 총 \(cardDect.card.count) 장의 카드가 있습니다.")
    }
    
    func printShuffle(_ cardDect: CardDeck) {
        print("전체 \(cardDect.card.count)장의 카드를 섞었습니다.")
    }
    
    func printRemoveOne(_ basic: [Card],_ pick: [Card]) {
        print("\(pick) \n총 \(basic.count)장의 카드가 남아있습니다.")
    }
}
