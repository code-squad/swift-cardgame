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
    for count in 1..<8 {
        OutputView.printCardStack(with: cardDeck.pickCardStack(by: count))
    }
}

main()


