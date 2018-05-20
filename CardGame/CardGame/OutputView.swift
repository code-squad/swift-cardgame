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
    func printWinnerOfPlayer(_ handler: (Int, PokerHands.Hand) -> Void)
    func printDealerHand(_ handler: (PokerHands.Hand) -> Void)
    func printWinnerOfGame(_ handler: (String, PokerHands.Hand) -> Void)
}

struct OutputView {
    static func printCardsOfCardGame(_ cardGame: CardGamePlayersPrintable) {
        cardGame.printPlayerCards { print("\($0)") }
        cardGame.printDealerCards { print("딜러 \($0)") }
    }
    
    static func printHandOfWinnerPlayer(_ cardGame: CardGamePlayersPrintable) {
        cardGame.printWinnerOfPlayer { print("우승 참가자 :  참가자#\($0), 핸드: \($1)")}
    }
    
    static func printHandOfDealer(_ cardGame: CardGamePlayersPrintable) {
        cardGame.printDealerHand { print("딜러의 핸드: \($0)") }
    }
    
    static func printHandOfGameWinner(_ cardGame: CardGamePlayersPrintable) {
        cardGame.printWinnerOfGame { print("게임의 최종 우승자는 \($0)입니다. 우승 핸드: \($1)") }
    }
}
