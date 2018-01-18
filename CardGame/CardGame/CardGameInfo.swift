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
    private (set) var numberOfCards = Numbers.Seven.rawValue
    private (set) var numberOfPlayers = Numbers.One.rawValue
    
    init(menuNum: CardGameInfo.Menu, numberOfPlayers: CardGameInfo.NumberOfParticipantsCases) {
        if menuNum == .SevenCardGame {
            self.numberOfCards = Numbers.Seven.rawValue
        } else {
            self.numberOfCards = Numbers.Five.rawValue
        }
        self.numberOfPlayers = numberOfPlayers.rawValue
    }
    
    enum Menu: Int {
        case SevenCardGame = 1 , FiveCardGame, ExitGame, PleaseInputAgain
    }
    
    enum NumberOfParticipantsCases: Int {
        case One = 1, Two, Three, Four, InValidNumber
    }
    
    enum Numbers: Int {
        case One = 1, Two, Three, Four, Five, Six, Seven
    }
}
