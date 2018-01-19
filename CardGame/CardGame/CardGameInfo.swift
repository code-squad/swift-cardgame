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
    private (set) var numberOfCards = CountOfCardGame.SevenCard.rawValue
    private (set) var numberOfPlayers = CardGameInfo.NumberOfParticipantsCases.One.rawValue
    
    init(menuNum: CardGameInfo.Menu, numberOfPlayers: CardGameInfo.NumberOfParticipantsCases) {
        if menuNum == .SevenCardGame {
            self.numberOfCards = CountOfCardGame.SevenCard.rawValue
        } else {
            self.numberOfCards = CountOfCardGame.FiveCard.rawValue
        }
        self.numberOfPlayers = numberOfPlayers.rawValue
    }
    
    enum Menu: Int {
        case SevenCardGame = 1 , FiveCardGame, ExitGame, PleaseInputAgain
    }
    
    enum CountOfCardGame: Int {
        case SevenCard = 7
        case FiveCard = 5
    }
    
    enum NumberOfParticipantsCases: Int {
        case One = 1, Two, Three, Four, InValidNumber
    }
}
