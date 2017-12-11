//
//  OutputView.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func resetMsg() {
        print("카드 전체를 초기화했습니다.")
    }
    
    func countOfDeck(_ deck: Deck) {
        print("총 \(deck.count())장의 카드가 있습니다.\n")
    }
    
    func countOfRestDeck(_ deck: Deck) {
        print("전체 \(deck.count())장의 카드를 섞었습니다.\n")
    }
    
    func showMeTheCard(_ card: Card?) {
        guard let isCard = card else {
            errorMsg(.zeroCard)
            return
        }
        print(isCard)
    }
    
    func showMeTheTable(table: Table, dealerCard: [Card]) {
        printSleepLikeDealer(table)
        for cardsIndex in 0..<table.gameInfo.typeOfGames.rawValue {
            for playerIndex in 0..<table.cardStacksOfTable.count {
                sleep(1)
                print("[\(table.cardStacksOfTable[playerIndex][cardsIndex])]   ", terminator :"")
            }
            sleep(1)
            lookDealerCards(of: dealerCard, stackIndex: cardsIndex)
        }
        
    }
    
    private func printSleepLikeDealer(_ table: Table) {
        var playerColumn = [String]()
        for index in 0..<table.cardStacksOfTable.count {
            playerColumn.append("참가자\(index + 1)#  ")
        }
        playerColumn.append("딜러\n")
        
        for index in 0..<playerColumn.count {
            print(playerColumn[index], terminator: "")
        }
    }
    
    private func lookDealerCards(of cards: [Card], stackIndex: Int) {
        print("[\(cards[stackIndex])]")
    }
    
    func showMeTheResultOfGame(_ table: Table, dealerCards: [Card]) {
        let pokerHand = PokerHand()
        let playersResult = pokerHand.makePokerHandRanking(table.cardStacksOfTable)
        let dealerResult = pokerHand.makePokerHandRanking([dealerCards])
        let playerTopScore = playersResult.score.max()!
        let playerTopScoreIndex = playersResult.score.index(of: playerTopScore)!
        print("결과를 집계중입니다..")
        sleep(2)
        print("=============================")
        if dealerResult.score[0] > playerTopScore {
            print("딜러가 이겼습니다. 결과는 \(dealerResult.hand[0]).")
        } else {
            print("참가자\(playerTopScoreIndex + 1)가 이겼습니다. 결과는 \(playersResult.hand[playerTopScoreIndex]).")
        }
        print("=============================\n")
    }

}

extension OutputView {
    func errorMsg(_ code: ErrorCode) {
        print("\(code.rawValue)")
    }
}
