//
//  OutputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {
    
    /*
     card인스턴스의 속성값을 문자열로 바꾸는 함수.
     현재 프로그램 규모로 봤을때 아직 작고, 출력을 위한 기능이라서 outputView에 위치하는게 맞다고 판단하였습니다.
     */
    func makeString(card: Card) -> String {
        let suit = card.cardSuit()
        let denomination = card.cardDenomination()
        return suit + denomination
    }
    
    func showResult(text: String) {
        print(text)
    }
}

