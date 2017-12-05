//
//  PokerGame.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct PokerGame {
    private var players: Array<Player> = []
    private var dealer: Player = Player.init(name: "dealer")
    private let pokerRule: PokerRules
    private var dealerAction: DealerAction

    enum GuideMessage: String, Error {
        case notEnoughCard = "더이상 카드가 모두에게 돌아갈 수 없습니다."
    }

    enum PokerRules: Int {
        case none, sevenStud, fiveStud

        var value: Int {
            switch self {
            case .sevenStud:
                return 7
            case .fiveStud:
                return 5
            case .none:
                return 0
            }
        }
    }

    init(dealerAction: DealerAction, playerCount: Int, pokerRule: PokerRules) {
        for i in 1...playerCount {
            players.append(Player.init(name: "참가자#\(i)"))
        }
        self.pokerRule = pokerRule
        self.dealerAction = dealerAction
    }

    mutating func setPokerGame() -> Bool {
        for _ in 1...getAvailableTurnCount() {
            guard nextTurn() else {
                return false
            }
        }
        return true
    }

    mutating func nextTurn() -> Bool {
        guard players.count+1 < dealerAction.count() else {
            return false
        }
        for i in 0..<players.count {
            players[i].callNewCard(dealerAction.removeOne()!)
        }
        dealer.callNewCard((dealerAction.removeOne())!)
        return true
    }

    private func getAvailableTurnCount() -> Int {
        return Int(pokerRule.value/2)
    }

    mutating func play() -> Bool {
        for _ in 0..<(pokerRule.value-Int(pokerRule.value/2)) {
            guard nextTurn() else {
                return false
            }
        }
        return true
    }

    func showPokerTable() -> String {
        var table: String = ""
        for i in 0..<players.count {
            table += players[i].description + "\n"
        }
        table += dealer.description
        return table
    }

}

typealias PokerWinnerChecker = PokerGame

extension PokerWinnerChecker {

    private func openCards() {
        for i in 0..<players.count {
            players[i].openCards()
        }
        dealer.openCards()
    }

    private func findWinner() -> Player {
        var allPlayer = players
        allPlayer.append(dealer)
        allPlayer.sort()
        return allPlayer.last!
    }

    func showWinner() -> String {
        openCards()
        var tableForWinner: String = ""
        for i in 0..<players.count {
            tableForWinner += players[i].winnerDescription + "\n"
        }
        tableForWinner += dealer.winnerDescription + "\n"
        tableForWinner += "Winner!!! : \(findWinner().winnerDescription)"
        return tableForWinner
    }

}
