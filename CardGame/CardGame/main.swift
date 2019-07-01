//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let deck = CardDeck()
    while let selectedNumber = InputView.menuNumber(), selectedNumber != 0 {
        guard let  selectedMenu = DeckMenu.init(rawValue: selectedNumber) else {
            return
        }
        let game = Dealer(deck: deck)
        let result = game.play(of: selectedMenu)
        OutputView.printResult(of: result)
    }
}

main()

