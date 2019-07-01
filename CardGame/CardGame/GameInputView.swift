//
//  GameInputView.swift
//  CardGame
//
//  Created by BLU on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    
    enum Menu: CustomStringConvertible {
        case selectGame
        case enterNumberOfPlayers
        
        var description: String {
            switch self {
            case .selectGame:
                return "카드 게임 종류를 선택하세요."
            case .enterNumberOfPlayers:
                return "참여할 사람의 인원을 입력하세요."
            }
        }
    }
    
    static private func ask(for menu: Menu) -> String {
        print(menu)
        return readLine() ?? ""
    }
}
