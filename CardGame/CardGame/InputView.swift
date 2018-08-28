//
//  InputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum GameType : String {
    case seven = "1"
    case five = "2"
    
    var number: Int {
        switch self {
        case .seven:
            return 7
        case .five:
            return 5
        }
    }
}

enum NumberOfPlayers : String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    
    var number: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        }
    }
}

struct InputView {
    // return GameType
    public static func readGameType() throws -> GameType? {
        let message =
        """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        print(message)
        guard let inputGameType = InputView.isEmpty(to: readLine()) else { return nil }
        guard let gameType = GameType.init(rawValue: inputGameType) else { throw CardError.inputRangeExceeded }
        return gameType
    }
    
    public static func readPlayer() throws -> NumberOfPlayers? {
        let message = "참여할 사람의 인원을 입력하세요."
        print(message)
        guard let inputPlayer = InputView.isEmpty(to: readLine()) else { return nil }
        guard let player = NumberOfPlayers.init(rawValue: inputPlayer) else { throw CardError.inputRangeExceeded }
        return player
    }
    
    // 입력값 비어 있는지 확인하는 함수
    public static func isEmpty(to value:String?) -> String? {
        guard let inputValue = value else { return nil }
        if inputValue.isEmpty { return nil }
        return inputValue
    }
}
