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
    static func errorPrint(of error: String) {
        print(error)
    }
    
    /// Error를 출력하는 함수
    static func otherErrorPrint(of error: Error) {
        print(error)
    }
    
    /// 참가자와 딜러가 가지고 있는 카드들을 출력하는 함수
    static func printPlayersCards(of players: [Player]) {
        var playerAndCard = players
        for index in 0..<playerAndCard.count {
            print(playerAndCard[index].playerToPrint())
        }
    }
    
    /// 승자를 출력하는 함수
    static func printWinner(of winnerMent: String) {
        print(winnerMent)
    }
}
