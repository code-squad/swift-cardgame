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

enum Message : CustomStringConvertible {
    case gameType
    case readPlayer

    var description: String {
        switch self {
        case .gameType:
            return "카드 게임 종류를 선택하세요. \n1. 7카드 \n2. 5카드"
        case .readPlayer:
            return "참여할 사람의 인원을 입력하세요."
        }
    }
}

struct InputView {
    // return GameType
    public static func readGameType() throws -> GameType {
        guard let inputGameType = InputView.readInput(with: Message.gameType) else { throw CardError.inputNil }
        guard let gameType = GameType.init(rawValue: inputGameType) else { throw CardError.inputRangeExceeded }
        return gameType
    }
    
    public static func readPlayer() throws -> NumberOfPlayers {
        guard let inputPlayer = InputView.readInput(with: Message.readPlayer) else { throw CardError.inputNil }
        guard let player = NumberOfPlayers.init(rawValue: inputPlayer) else { throw CardError.inputRangeExceeded }
        return player
    }
    
    // 입력값 받는 함수
    public static func readInput(with message:Message) -> String? {
        print(message.description)
        guard let inputGameType = InputView.isEmpty(to: readLine()) else { return nil }
        return inputGameType
    }
    
    // 입력값 비어 있는지 확인하는 함수
    public static func isEmpty(to value:String?) -> String? {
        guard let inputValue = value else { return nil }
        if inputValue.isEmpty { return nil }
        return inputValue
    }
}
