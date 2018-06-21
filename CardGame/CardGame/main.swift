//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func step2(){
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
func step3(){
    // 아웃풋뷰 생성
    let outputView = OutputView()
    // 덱 생성
    var deck = Deck()
    // 덱에서 카드리스트 생성 후 셔플
    deck.reset()
    deck.shuffle()
    // 슬롯 7개 생성
    guard let cards1 = deck.removeCards(1), let cards2 = deck.removeCards(2), let cards3 = deck.removeCards(3), let cards4 = deck.removeCards(4), let cards5 = deck.removeCards(5), let cards6 = deck.removeCards(6), let cards7 = deck.removeCards(7) else {
        outputView.noMoreCardMessage()
        return ()
    }
    
    print(Slot(cards1))
    print(Slot(cards1))
    print(Slot(cards2))
    print(Slot(cards3))
    print(Slot(cards4))
    print(Slot(cards5))
    print(Slot(cards6))
    print(Slot(cards7))
}
/// 스텝4 용 메인함수
func step4(){
    // 아웃풋뷰 생성
    let outputView = OutputView()
    // 게임인풋뷰 생성
    let gameInputView = GameInputView()
    // 덱 생성
    var deck = Deck()
    // 슬롯 생성을 위해 게임보드를 만든다
    let gameBoard = GameBoard()
    // 카드가 다 떨어질때까지 게임을 계속한다
    while true {
        // 덱을 초기화한다
        deck.reset()
        // 덱을 섞어준다
        deck.shuffle()
        
        // 게임 모드를 선택한다
        let gameMode = gameInputView.selectGameMode()
        // 플레이어 수를 선택한다
        let playerNumber = gameInputView.selectPlayerNumber()
        // (플레이어수 + 딜러 1) * 게임모드 카드수 만큼 카드를 뽑는다
        guard let cards = deck.removeCards((playerNumber+1)*gameMode.rawValue) else {
            outputView.noMoreCardMessage()
            return ()
        }
        // slot 배열을 만든다. 인덱스 0 이 딜러, 이후 인덱스가 플레이어
        guard let slotList = gameBoard.makeSlots(gameMode: gameMode, playerNumber: playerNumber, cards: cards) else {
            outputView.noMoreCardMessage()
            return ()
        }
        // 모든 플레이어의 카드를 출력한다
        outputView.printAll(slotList: slotList, playerNumber: playerNumber)
    }
}

step4()
