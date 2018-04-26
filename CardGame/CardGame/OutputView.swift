//
//  OutputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {

    func printMenu() {
        print("다음 메뉴를 선택해주세요. \n1. 카드 초기화 \n2. 카드 섞기 \n3. 카드 하나 뽑기 \n> ", terminator: "")
    }
    
    func printReset(_ card: OutputPrintable) {
        print("카드 전체를 초기화했습니다. 총 \(card.countOfCards())의 카드가 있습니다. \n")
    }
    
    func printShuffle(_ card: OutputPrintable) {
        print("전체 \(card.countOfCards())의 카드를 섞었습니다. \n")
    }
    
    func printRemoveOne(_ pickCard: Card,_ card: OutputPrintable) {
        print("\(pickCard) \n총 \(card.countOfCards())의 카드가 남아있습니다. \n ")
    }
    
    func printinValid() {
        print("1,2,3번만 선택 가능합니다. \n")
    }
    
}
