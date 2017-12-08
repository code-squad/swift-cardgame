//
//  OutputView.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class OutputView {
    var game: StudPokerGame
    init(_ game: StudPokerGame) {
        self.game = game
    }

    // 모든 플레이어의 이름과 소유 카드를 출력.
    func printCardStacksWithName() {
        for player in self.game {
            self.printCards(of: player)
        }
        sleep(1)
    }

    // 한 플레이어의 카드스택 출력.
    func printCards(of player: Player) {
        let cards = player.showAllCards()
        print("\(player.name)\t", terminator: "[ ")
        self.printCardsEachSecond(cards)
        print("]")
    }

    // 카드를 1초에 한 장씩 출력.
    func printCardsEachSecond(_ cards: CardStack) {
        for card in cards {
            sleep(1)
            print("\(card)", terminator: " ")
        }
    }

    // 승자 출력.
    func printWinner(_ winner: Player) {
        // 이름 출력.
        print("게임의 승자는 \(winner.name)입니다.", terminator: "")
        // 카드패 승자가 없는 경우, 탑카드 출력.
        if !game.hasBestHandWinner {
            print("승리패는 없습니다. 승자의 탑카드는 \(winner.topCard.description)입니다.")
        }else {
            // 승리패 출력.
            print("승리패는 \(winner.stackRank.rawValue)입니다.")
        }
        // 승자가 가진 카드스택 출력.
        print("위너의 정렬된 카드: ", winner.showAllCards().sortCards())
    }

}
