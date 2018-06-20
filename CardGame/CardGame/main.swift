//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 덱 생성
    var deck = Deck()
    // 인풋뷰 생성
    let inputView = InputView()
    // 아웃풋뷰 생성
    let outputView = OutputView()
    // 무한반복.
    while true {
        // 유저입력을 받는다. 잘못된 입력일경우 반복문 리셋
        guard let userInput = inputView.getUserInput() else {
            outputView.printWrongMenu()
            continue
        }
        // 입력값으로 분기
        switch userInput {
        // 리셋
        case .reset :
            deck.reset()
            outputView.printResetMessage()
        // 셔플
        case .shuffle :
            // 카드가 없을경우 에러메세지 출력
            if deck.count() == 0 {
                outputView.noMoreCardMessage()
            }
            else {
                deck.shuffle()
                outputView.printShuffleMessage(cardCount: deck.count())
            }
        // 카드 뽑기
        case .removeOne :
            if let removedCard = deck.removeOne() {
                print(removedCard.getInfo())
                outputView.printRmoveOneMessage(cardCount: deck.count())
            }
            // 카드가 없을경우 에러메세지 출력
            else {
                outputView.noMoreCardMessage()
            }
        }
    }
}

/// 기존 기능은 손대지 않고 새로운 메인함수를 만들어서 실행하도록 수정.
func main2(){
    // 덱 생성
    var deck = Deck()
    // 덱에서 카드리스트 생성 후 셔플
    deck.reset()
    deck.shuffle()
    // 슬롯 7개 생성
    let slot1 = Slot(deck.removeCards(1)!)
    let slot2 = Slot(deck.removeCards(2)!)
    let slot3 = Slot(deck.removeCards(3)!)
    let slot4 = Slot(deck.removeCards(4)!)
    let slot5 = Slot(deck.removeCards(5)!)
    let slot6 = Slot(deck.removeCards(6)!)
    let slot7 = Slot(deck.removeCards(7)!)
    
    print(slot1.getInfo())
    print(slot2.getInfo())
    print(slot3.getInfo())
    print(slot4.getInfo())
    print(slot5.getInfo())
    print(slot6.getInfo())
    print(slot7.getInfo())
}

main2()
