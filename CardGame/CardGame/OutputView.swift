//
//  OutputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printCardStack(by stack: CustomStringConvertible) {
        print(stack)
    }
    
    func printError(_ error: String) {
        print(error)
    }
    
    func showResults(of cardGame: CardGame) {
        let players = cardGame.playerStatus()
        players.forEach {
            print($0.description)
        }
    }
}
