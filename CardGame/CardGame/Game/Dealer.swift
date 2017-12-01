//
//  Dealer.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    private(set) var deck: Deck
    private(set) var cardStacks: [CardStack]
    init() {
        self.deck = Deck()
        self.cardStacks = []
    }
    enum GameMenu: Int {
        case reset = 1
        case shuffle
        case remove
    }
    static let participantMinimum = 1
    static let participantMaximum = 4
    enum Stud: Int {
        case fiveCard = 5
        case sevenCard = 7
    }
    enum CardGameError: String, Error {
        case lackOfCards = "덱에 카드가 없습니다."
    }

    mutating func start(_ numberOfPeople: Int, _ stud: Stud) throws {
        let cardDemands = (numberOfPeople + 1) * stud.rawValue
        guard self.deck.count - cardDemands > 0 else { throw CardGameError.lackOfCards }
        self.deck.shuffle()
        setCardStack(of: numberOfPeople, with: stud)
    }

    private mutating func setCardStack(of numberOfPeople: Int, with stud: Stud) {
        // 이전 게임 때 스택 지우기. (이전 게임에 사용된 카드는 제외)
        resetCardStack()
        var participants = numberOfPeople
        // 딜러의 스택까지 포함하여 생성.
        for _ in 0...participants {
            defer { participants -= 1 }
            guard let cardStack = self.deck.removeMany(selectedCount: stud.rawValue) else { break }
            self.cardStacks.append(cardStack)
        }
    }

    mutating func resetCardStack() {
        self.cardStacks = []
    }

}
