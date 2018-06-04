//
//  InputView.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

struct InputView {
    
    // 카드게임 타입을 받는 함수
    static func readGameRule() throws -> CARDGAME.RURE {
        print(CARDGAME.ASK.Rule)
        let readInput = readLine() ?? ""
        guard let cardGameRule = CARDGAME.RURE.init(rawValue: readInput), cardGameRule == CARDGAME.RURE.SevenCard  || cardGameRule == CARDGAME.RURE.FiveCard else {
            throw CARDGAME.ERROR.inValidRule
        }
        
        return cardGameRule
    }
    
    // 카드게임 플레이어 수를 받는 함수
    static func readNumberOfPlater() throws -> CARDGAME.PLAYER {
        print(CARDGAME.ASK.NumberOfPlayer)
        let readInput = readLine() ?? ""
        guard let numberOfPlayer = CARDGAME.PLAYER.init(rawValue: readInput) else {
            throw CARDGAME.ERROR.overPlayer
        }
        return numberOfPlayer
    }
}
