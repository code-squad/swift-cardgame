//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    static func run(){
        do {
            let originCards = CardDeckGenerator.generateCards()
            var deck = CardDeck(cards: originCards)
            deck.shuffle()
            
            while true { // true -> false
                let picked = try InputView<GameCategory>.read()
                let player = try InputView<GamePlayer>.read()
                
            }
        } catch let err as CardGameError {
            OutputView.display(err)
        } catch {
            OutputView.display(.unknown)
        }
    }
}

Main.run()
