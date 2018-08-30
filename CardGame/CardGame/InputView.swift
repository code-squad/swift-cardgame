//
//  InputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    // return GameType
    public static func readGameType() throws -> GameType {
        guard let inputGameType = InputView.readInput(with: Message.gameType) else { throw InputError.inputNil }
        guard let gameType = GameType.init(rawValue: inputGameType) else { throw InputError.inputRangeExceeded }
        return gameType
    }
    
    public static func readPlayer() throws -> NumberOfPlayers {
        guard let inputPlayer = InputView.readInput(with: Message.readPlayer) else { throw InputError.inputNil }
        guard let player = NumberOfPlayers.init(rawValue: Int(inputPlayer) ?? 0) else { throw InputError.inputRangeExceeded }
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
