//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

// 주석을 활용해 기능 일시 제거
func main() {
    let cardDeck : CardDeck = CardDeck()
//    while true { PlayCardGame.playGame(with: cardDeck) }
    OutputView.printCardStack(with: cardDeck.makeCardStack())
}

main()


