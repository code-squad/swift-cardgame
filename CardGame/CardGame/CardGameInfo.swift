//
//  CardSet.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 카드게임 관련 정보를 모아놓은 클래스
class CardGameInfo {
    enum Menu: Int {
        case reset = 1, suffle, pick, end, pleaseInputAgain
    }
}
