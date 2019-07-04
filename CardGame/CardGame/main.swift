//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let cardDeck = CardDeck()
    var game = CardGame(cardDeck: cardDeck)
    var result: GameResult
    var menu: Menu
    
    gameLoop: while true {
        menu = Menu(InputView.readSelection())
        
        result = game.run(menu: menu)
        
        OutputView.printResult(of: result)
        
        if menu == .exit {
            break gameLoop
        }
    }
}

main()
