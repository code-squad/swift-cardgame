//
//  GameInputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func sevenOrFiveGame () -> KindOfGame? {
        print(PreGameMessage.ofMenu, terminator: " ")
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let menu = Menu(rawValue: inputNum) else { return nil }
        return convertMenuNumToKindofCard(menuNum: menu)
    }
    
    static func numberOfParticipants () -> NumberOfParticipants? {
        print(PreGameMessage.ofCasesOfParticipants, terminator: " ")
        let input = readLine() ?? "0"
        guard let inputNum = Int(input), let numberOfParticipants = NumberOfParticipants(rawValue: inputNum) else { return nil }
        return numberOfParticipants
    }
    
    private static func convertMenuNumToKindofCard (menuNum: Menu) -> KindOfGame {
        return menuNum.rawValue == 1 ? .sevenCard : .fiveCard
    }
}
