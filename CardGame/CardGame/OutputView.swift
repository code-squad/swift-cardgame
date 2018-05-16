//
//  OutputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardGamePlayersPrintable {
    func printPlayerCards(_ handler: (GamePlayer) -> Void)
    func printDealerCards(by handler: (GamePlayer) -> Void)
}

struct OutputView {
    static func printCardsOfCardGame(_ cardGame: CardGamePlayersPrintable) {
        cardGame.printPlayerCards { print("\($0)") }
        cardGame.printDealerCards { print("딜러 \($0)") }
    }
}
