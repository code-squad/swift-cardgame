//
//  CommandExecutor.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PockerGameSubscriber {
    func didDistributeCard(game: PockerGame)
    func didResetCardDeck(cardDeck: CardDeck)
    func didShuffleCardDeck(cardDeck: CardDeck)
    func didFinishGame(game: PockerGame)
}

protocol GameStatusProvider {
    var deck: CardDeck { get }
    var numberOfPlayers: Int { get }
}

class PockerGame: GameStatusProvider {
    
    private(set) var deck: CardDeck
    private let subscriber : PockerGameSubscriber
    private var players: [PockerPlayer]
    
    var numberOfPlayers: Int {
        return players.count
    }
    
    init(players:[PockerPlayer], subscriber: PockerGameSubscriber) {
        self.subscriber = subscriber
        self.players = players
        self.deck = CardDeck()
    }
}

extension PockerGame:  CommandReceiverable {

    func onReceive(command: Command) {
        switch command {
        case .reset      : reset()
        case .shuffle    : shuffle()
        case .distribute : distributeCard()
        case .finish     : finish()
        }
    }
    
    private func reset() {
        deck.reset()
        for i in 0..<players.count {
            players[i].reset()
        }
        subscriber.didResetCardDeck(cardDeck: deck)
    }
    
    private func shuffle() {
        deck.shuffle()
        subscriber.didShuffleCardDeck(cardDeck: deck)
    }
    
    private func finish() {
        subscriber.didFinishGame(game: self)
    }
    
    private func distributeCard() {
        for i in 0..<players.count {
            let card = deck.removeOne()
            players[i].addCard(card: card)
        }
        subscriber.didDistributeCard(game: self)
    }
}

extension PockerGame: CustomStringConvertible {
    var description: String {
        return players.map { "\($0.name) \($0.description)" }.joined(separator: "\n")
    }
}
