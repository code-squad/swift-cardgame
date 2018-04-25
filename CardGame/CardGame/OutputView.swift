//
//  OutputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView: OutputPrintable {
    
    func printMenu() {
        print("다음 메뉴를 선택해주세요. \n1. 카드 초기화 \n2. 카드 섞기 \n3. 카드 하나 뽑기 \n> ", terminator: "")
    }
    
    func printReset(_ resetCard: [Card]) {
        print("카드 전체를 초기화했습니다. 총 \(resetCard.count) 장의 카드가 있습니다. \n")
    }
    
    func printShuffle(_ shuffleCard: [Card]) {
        print("전체 \(shuffleCard.count)장의 카드를 섞었습니다. \n")
    }
    
    func printRemoveOne(_ basic: [Card],_ pick: Card) {
        print("\(pick) \n총 \(basic.count)장의 카드가 남아있습니다. \n")
    }
    
    func printinValid() {
        print("1,2,3번만 선택 가능합니다. \n")
    }
    
}
