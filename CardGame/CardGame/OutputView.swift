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
        playingGame.printCards()
    }
    
    static let printCardSet = ( {(name: String, cards: [Card]) -> () in
        print ("\(name)", terminator : "[")
        for index in 0 ..< cards.count {
            sleep(1)
            print(cards[index].description, terminator: " ")
        }
        print ("]")
    })
    
    static func printContents (message: CustomStringConvertible) {
        print(message)
    }
    
}
