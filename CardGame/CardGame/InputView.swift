//
//  InputView.swift
//  CardGame
//
//  Created by Yoda Codd on 2018. 6. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    /// 메뉴 메세지 출력
    func printMenuMessage(){
        print ("""
다음 메뉴를 선택해주세요.
1. 카드 초기화
2. 카드 섞기
3. 카드 하나 뽑기
""")
    }
    
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
    
    /// 유저입력을 받아서 리턴하는 함수
    func getUserInput() -> String {
        return readLine()!
    }
}
