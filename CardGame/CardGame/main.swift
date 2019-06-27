//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var menu: Menu
    var cardDeck = CardDeck()

    gameLoop: while true {
        InputView.printMenu()
        let input = InputView.read()
        menu = Menu(selection: input)
        switch menu {
        case .reset:
            cardDeck.reset()
            OutputView.printCompletionOfReset(count: cardDeck.count())
        case .shuffle:
            cardDeck.shuffle()
            OutputView.printCompletionOfShuffle(count: cardDeck.count())
        case .remove:
            let removedCard = cardDeck.removeOne()
            OutputView.printCompletionOfRemove(card: removedCard, remainingCount: cardDeck.count())
        case .exit:
            break gameLoop
        }
    }
}

main()
