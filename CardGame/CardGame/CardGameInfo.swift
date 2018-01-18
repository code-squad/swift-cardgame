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
    private (set) var numberOfCards = 5
    private (set) var numberOfPlayers = 1
    
    init(menuNum: Int, numberOfPlayers: Int) {
        if menuNum == 1 {
            self.numberOfCards = 7
        } else {
            self.numberOfCards = 5
        }
        self.numberOfPlayers = numberOfPlayers
    }
    
    enum Menu: Int {
        case SevenCardGame = 1 , FiveCardGame, ExitGame, PleaseInputAgain
    }
    
    enum NumberOfParticipantsCases: Int {
        case One = 1, Two, Three, Four, InValidNumber
    }
}
