//
//  OutputView.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /// 결과를 출력하는 함수
    static func printResult(menuNumber: String, input: (cardCount: Int, ment: String)) {
        if input.ment != "" {
            print(input.ment)
        }
        if menuNumber == "2" {
            print("총 \(input.cardCount)장의 카드를 섞었습니다.")
        } else {
            print("총 \(input.cardCount)장의 카드가 남아있습니다")
        }
    }
    
    /// ErrorMessage에 해당하는 Error를 출력하는 함수
    static func errorPrint(of error: ErrorMessage) {
        print(error.rawValue)
    }
    
    /// 열거형으로 정의되지 않은 Error를 출력하는 함수
    static func otherErrorPrint(of error: Error) {
        print(error)
    }
    
    /// 카드 배열을 출력하기 위한 함수
    static func cardToPrint(cards: [Card]) -> String {
        var cardForPrint: String = "["
        for card in cards {
            cardForPrint += "\(card.suit.suit)\(card.rank.description),"
        }
        cardForPrint.removeLast()
        cardForPrint += "]"
        return cardForPrint
    }
    
    /// 참가자와 딜러가 가지고 있는 카드들을 출력하는 함수
    static func printPlayersCards(of playerAndCard: [[Card]]) {
        let participant: String = "참가자#"
        let dealer: String = "딜러"
        for playerNumber in 0..<playerAndCard.count-1 {
            print(participant+"\(playerNumber+1) \(cardToPrint(cards: playerAndCard[playerNumber]))")
        }
        print(dealer+" \(cardToPrint(cards: playerAndCard[playerAndCard.endIndex-1]))")
    }
}
