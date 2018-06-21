//
//  OutputView.swift
//  CardGame
//
//  Created by Yoda Codd on 2018. 6. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /// 리셋 메세지
    func printResetMessage(){
        print("카드 전체를 초기화했습니다. ")
    }
    /// 셔플 메세지
    func printShuffleMessage(cardCount: Int){
        print("전체 \(cardCount)장의 카드를 섞었습니다.")
    }
    /// 카드뽑기 메세지
    func printRmoveOneMessage(cardCount: Int){
        print("총 \(cardCount)장의 카드가 남아있습니다.")
    }
    
    /// 카드가 0 인데 뽑기를 시도할 경우 에러메세지
    func noMoreCardMessage(){
        print("카드가 없습니다.")
    }
    
    /// 잘못된 메뉴를 선택시
    func printWrongMenu(){
        print("올바른 메뉴를 선택해 주십시요.")
    }
    
    /// 슬롯 배열을 받아서 게임결과 형태로 리턴
    func printAll(slotList: [Slot], playerNumber: Int){
        for player in 1...playerNumber {
            print("참가자#\(player) \(slotList[player])")
        }
        // 딜러의 카드를 출력한다
        print("딜러 \(slotList[0])")
    }
}
