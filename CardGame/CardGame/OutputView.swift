//
//  OutputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardGamePlayersPrintable {
    func printPlayerCards(_ numberOfPlayers: Int, _ handler: (Int, GamePlayer) -> Void)
    func printDealerCards(by handler: (GamePlayer) -> Void)
}

struct OutputView {
    static func printCardsOfCardGame(_ cardGame: CardGamePlayersPrintable, _ numberOfPlayers: Int) {
        cardGame.printPlayerCards(numberOfPlayers) { print("참가자#\($0) \($1)") }
        cardGame.printDealerCards { print("딜러 \($0)") }
    }
}
