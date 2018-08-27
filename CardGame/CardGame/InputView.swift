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
    public static func readGameType() -> String? {
        let message =
        """
        카드 게임 종류를 선택하세요.
        1. 7카드
        2. 5카드
        """
        print(message)
        return readLine()
    }
    
    public static func readPlayer() -> String? {
        let message = "참여할 사람의 인원을 입력하세요."
        print(message)
        return readLine()
    }
    
    // 입력값 비어 있는지 확인하는 함수
    public static func isEmpty(to value:String?) -> String? {
        guard let inputValue = value else { return nil }
        if inputValue.isEmpty {
            return nil
        }
        
        return inputValue
    }
}
