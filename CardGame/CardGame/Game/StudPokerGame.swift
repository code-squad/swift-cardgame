//
//  StudPokerGame.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StudPokerGame: Sequence {
    private var stud: Stud
    private var dealer: Dealer
    private var deck: Deck
    private var players: [Player]
    let start: Int
    init(_ stud: Stud, with numberOfPlayers: Int) {
        self.stud = stud
        self.deck = Deck()
        self.dealer = Dealer(with: self.deck)
        self.players = []
        for _ in 0..<numberOfPlayers {
            self.players.append(Player())
        }
        self.start = 0
    }
    // 한 게임의 종료조건
    var canPlay: Bool {
        return false
    }
    var isDeckEmpty: Bool {
        return self.deck.isEmpty
    }

    func callDealer() -> Dealer {
        return self.dealer
    }

    func makeIterator() -> ClassIteratorOf<Player> {
        return ClassIteratorOf(self.players)
    }

    subscript(index: Int) -> Iterator.Element? {
        guard index > -1 else { return nil }
        return self[index]
    }

    private func isLackOfCards() -> Bool {
        let cardDemands = (self.players.count + 1) * self.stud.rawValue
        guard self.deck.count - cardDemands > 0 else { return true }
        return false
    }

    func begin() throws {
        guard !isLackOfCards() else { throw GameError.lackOfCards }
        try self.dealer.introduce(players, stud)
    }

}

extension StudPokerGame {
    static let participantMinimum = 1
    static let participantMaximum = 4
    enum Stud: Int {
        case fiveCard = 5
        case sevenCard = 7
    }
    enum GameError: String, Error {
        case lackOfCards = "덱에 카드가 없습니다."
    }
}
