//
//  CardGame.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct CardGame {
    public static func playGame() throws {
        let inputValue = InputView.readInput()
        
        // 입력값 비어있는지 확인
        guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
        
        guard let action = Action.init(rawValue: input) else { throw CardError.inputError }
        
        do {
            try action.execute()
        } catch CardError.noCardsRemaining {
            throw CardError.noCardsRemaining
        } catch {
            throw CardError.unknown
        }
    }
}
