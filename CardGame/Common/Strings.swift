//
//  Strings.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

enum CARDGAME {
    
    enum playerNames: CustomStringConvertible {
        case player
        case dealer
        
        var description: String {
            switch self {
            case .player:
                return "참가자 #"
            case .dealer:
                return "딜러 "
            }
        }
    }
    
    enum ASK: String, CustomStringConvertible {
        case Rule
        case NumberOfPlayer
        
        var description: String{
            switch self {
            case .Rule:
                return """
                카드 게임 종류를 선택하세요
                1. 7카드
                2. 5카드
                """
            case .NumberOfPlayer:
                return "참여 할 사람의 인원을 입력하세요"
            }
        }
    }
    
    enum RURE: String {
        case SevenCard = "1"
        case FiveCard = "2"
        
        var `Type`: Int {
            switch self {
                case .SevenCard:
                    return 7
                case .FiveCard:
                    return 5
            }
        }
    }
    
    enum PLAYER: String {
        case One = "1"
        case Two = "2"
        case Three = "3"
        case Four = "4"
        
        var Count: Int {
            switch self {
                case .One:
                    return 1
                case .Two:
                    return 2
                case .Three:
                    return 3
                case .Four:
                    return 4
            }
        }

    }
    
    enum ERROR: Swift.Error, CustomStringConvertible {
        case isNil
        case unExpected
        case inValidRule
        case overPlayer
        
        var description: String {
            switch self {
                case .isNil:
                    return "선택한 값이 없습니다."
                case .unExpected:
                    return "unExpected Error"
                case .inValidRule:
                    return "1, 2 번 중에 선택해주세요"
                case .overPlayer:
                    return "Payer 수는 1명 부터 4명까지만 가능합니다."
            }
        }
    }
}
