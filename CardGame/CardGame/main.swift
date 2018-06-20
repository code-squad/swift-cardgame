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
    // 반복문용 플래그
    var flag = true
    repeat {
        // 유저입력 요구 메세지
        inputView.printMenuMessage()
        // 유저입력을 받는다
        let userInput = inputView.getUserInput()
        // 입력값으로 분기
        switch userInput {
        // 리셋
        case "1" :
            deck.reset()
            inputView.printResetMessage()
        // 셔플
        case "2" :
            // 카드가 없을경우 에러메세지 출력
            if deck.count() == 0 {
                inputView.noMoreCardMessage()
            }
            else {
                deck.shuffle()
                inputView.printShuffleMessage(cardCount: deck.count())
            }
        // 카드 뽑기
        case "3" :
            if let removedCard = deck.removeOne() {
                print(removedCard.getInfo())
                inputView.printRmoveOneMessage(cardCount: deck.count())
            }
            // 카드가 없을경우 에러메세지 출력
            else {
                inputView.noMoreCardMessage()
            }
        // 이외의 경우는 프로그램 종료
        default : flag = false
        }
    } while flag
}

main()
