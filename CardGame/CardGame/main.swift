//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck = CardDeck.init()
    while(!cardDeck.isEmpty) {
        let numSelect = InputView.getCardGameStart()
        guard let menuNumber = MenuBox.getMenu(numSelect) else { continue }
        let result = cardDeck.makeStatus(menuNumber)
        OutputView.output(result)
        guard menuNumber != .quit else { break }
    }
}

main()

