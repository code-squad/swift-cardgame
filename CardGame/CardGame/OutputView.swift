//
//  OutputView.swift
//  CardGame
//
//  Created by YOUTH on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {

    enum ProgramDescription: CustomStringConvertible {
        case chooseCardStud
        case askNumberOfPlayer
        case quitGame
        case lackOfCard

        var description: String {
            switch self {
            case .chooseCardStud:
                return "카드 게임 종류를 선택하세요.\n 1. 7카드\n 2. 5카드"
            case .askNumberOfPlayer:
                return "참여할 인원 수를 입력하세요."
            case .quitGame:
                return "=== 게임 종료 ==="
            case .lackOfCard:
                return "카드가 모자랍니다 :( 게임을 종료합니다!\n"
            }
        }
    }

    func showResult(text: CustomStringConvertible) {
        print(text.description)
    }


    func printCards(_ player: Player) {
        let cards = player.stack
        print("참가자 #\(player.position!): ", terminator: "[ ")
        self.printCardsWithPause(cards)
        print(" ]")
    }

    func printCardsWithPause(_ cards: CardStack) {
        for i in 0..<cards.cards.count {
            sleep(1)
            print("\(cards.cards[i].description)", terminator: " ")
        }

    }

    func printCardsStackWithName(_ table: CardTable) {
        for player in table.players {
            self.printCards(player)
        }
        sleep(1)
        // 딜러 프린트
        let dealer = table.dealer
        print("딜러: ", terminator: "[ ")
        self.printCardsWithPause(dealer.stack)
        print(" ]")
        sleep(1)
    }
}

