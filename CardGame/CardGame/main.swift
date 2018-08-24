//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct CardGame {
    public static func play() {
        while true {
            do {
                let inputValue = InputView.readInput()
                guard let input = InputView.isEmpty(to: inputValue) else { throw CardError.inputNil }
                
                try self.pickMenu(input)
            } catch CardError.inputError {
                print(CardError.inputError.rawValue)
                print()
            } catch CardError.inputNil {
                print(CardError.inputNil.rawValue)
                print()
            } catch CardError.noCardsRemaining {
                print(CardError.noCardsRemaining.rawValue)
                print()
            } catch {
                print(CardError.unknown.rawValue)
                print()
            }
        }
    }
    
    private static func pickMenu(_ input: String) throws {

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

CardGame.play()
