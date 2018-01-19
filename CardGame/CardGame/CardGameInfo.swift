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
    private (set) var numberOfCards: CountOfCardGame = .SevenCard
    private (set) var numberOfPlayers: NumberOfParticipantsCases = .One
    init(menuNum: CardGameInfo.Menu, numberOfPlayers: CardGameInfo.NumberOfParticipantsCases) {
        self.numberOfCards = menuNum.convert() ?? .SevenCard
        if let numberofPlayers = NumberOfParticipantsCases(rawValue: numberOfPlayers.rawValue) {
            self.numberOfPlayers = numberofPlayers
        }
    }
    
    enum Menu: Int {
        case SevenCardGame = 1 , FiveCardGame, ChargeCard, ExitGame, PleaseInputAgain
        func convert () -> CountOfCardGame? {
            switch self {
            case .SevenCardGame: return .SevenCard
            case .FiveCardGame: return .FiveCard
            default:
                return nil
            }
        }
    }
    
    enum CountOfCardGame: Int {
        case SevenCard = 7
        case FiveCard = 5
    }
    
    enum NumberOfParticipantsCases: Int {
        case One = 1, Two, Three, Four, InValidNumber
    }
}
