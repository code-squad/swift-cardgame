//
//  OutputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    private var card: OutputPrintable
    
    init(_ card: OutputPrintable) {
        self.card = card
    }
    
    func printNumberOfCard() {
        print("카드 게임 종류를 선택하세요. \n1. 7카드 \n2. 5카드 \n> ", terminator: "")
    }
    
    func printNumberOfPlayer() {
        print("참여할 사람의 인원을 입력하세요. \n> ", terminator: "")
    }
    
    func printMenu() {
        print("다음 메뉴를 선택해주세요. \n1. 카드 초기화 \n2. 카드 섞기 \n3. 카드 하나 뽑기 \n> ", terminator: "")
    }
    
    func printReset() {
        print("카드 전체를 초기화했습니다. 총 \(self.card.countOfCards())의 카드가 있습니다. \n")
    }
    
    func printShuffle() {
        print("전체 \(self.card.countOfCards())의 카드를 섞었습니다. \n")
    }
    
    func printRemoveOne(_ pickCard: Card) {
        print("\(pickCard) \n총 \(self.card.countOfCards())의 카드가 남아있습니다. \n ")
    }
    
    func printInvalidOfCards() {
        print("카드 선택을 다시 해주세요.")
    }
    
    func printInvalidOfPlayers() {
        print("참여 인원은 최소 1명 부터 최대 4명 입니다")
    }
    
    func printCardStack(_ cardStack: CardStackPrintable) {
        cardStack.printCardStack( { cards in
            print("\(cards)")
        } )
    }
    
}
