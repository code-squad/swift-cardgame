//
//  PockerGameCommander.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Command: Int {
    case reset = 1, shuffle, distribute, finish
}

protocol Commandable {
    func next() -> Command
}

class PockerGameDealer: PockerPlayable {
    
    private var game: PockerGame?
    private let pockerGameType: PockerGameType
    private(set) var name: String
    private(set) var cards: [Card]
    private var numberOfDistribution: Int
    
    init(pockerGameType: PockerGameType) {
        self.pockerGameType = pockerGameType
        self.numberOfDistribution = 0
        self.game = nil
        self.name = "Dealer"
        self.cards = []
    }
    
    private init(game: PockerGame?, gameType: PockerGameType, name: String, cards: [Card], numberOfDistribution: Int) {
        self.game = game
        self.pockerGameType = gameType
        self.name = name
        self.cards = cards
        self.numberOfDistribution = numberOfDistribution
    }
    
    func assign(game: PockerGame) {
        self.game = game
    }
    
    func updated(by cards: [Card]) -> PockerPlayable {
        return PockerGameDealer(game: game, gameType: pockerGameType, name: name, cards: cards, numberOfDistribution: numberOfDistribution)
    }
}


extension PockerGameDealer: Commandable {
    func canDistributeCards() -> Bool {
        guard let game = game else {
            return false
        }
        return pockerGameType.rawValue > numberOfDistribution &&
            game.deck.cards.count >= game.numberOfPlayers
    }
    
    func next() -> Command {
        guard canDistributeCards(), game != nil else {
            return Command.finish
        }
        numberOfDistribution += 1
        return Command.distribute
    }
}
