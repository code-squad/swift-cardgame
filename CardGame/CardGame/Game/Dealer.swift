//
//  Dealer.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    private var deck: Deck
    init(with deck: Deck) {
        self.deck = deck
    }
    
    enum Operation: Int {
        case reset = 1
        case shuffle
        case remove
    }

    mutating func introduce(_ players: [Player], _ stud: StudPokerGame.Stud) throws {
        self.deck.shuffle()
        try self.dealCards(numberOf: stud.rawValue, to: players)
    }

    private mutating func dealCards(numberOf count: StudPokerGame.Stud.RawValue, to players: [Player]) throws {
        // 이전 게임 때 스택 지우기. (이전 게임에 사용된 카드는 제외)
        self.resetStacksOf(players)
        // 딜러의 스택까지 포함하여 생성.
        for player in players {
            let cardStackForOnePlayer = try drawCards(numberOf: count)
            player.take(cards: cardStackForOnePlayer)
        }
    }

    private func drawCards(numberOf count: StudPokerGame.Stud.RawValue) throws -> CardStack {
        guard let newCardStack = self.deck.removeMany(selectedCount: count) else { throw StudPokerGame.GameError.lackOfCards }
        return newCardStack
    }

    var endIndex: Int {
        return self.endIndex
    }

    private func append(_ cardStack: CardStack) {
        self.append(cardStack)
    }

    private mutating func resetStacksOf(_ players: [Player]) {
        for player in players {
            self.resetStackOf(player)
        }
    }

    private mutating func resetStackOf(_ player: Player) {
        player.resetStack()
    }

}
