//
//  OutputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct OutputView {
    static func printCardsOfPlayers(_ playingGame: PlayingGame) {
        playingGame.printCardSetOfPlayers()
    }
    
    static func printContents (message: CustomStringConvertible) {
        print(message)
    }
    
}
