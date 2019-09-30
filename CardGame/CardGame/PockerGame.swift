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
    private var registry: PockerPlayerRegistry
    
    var numberOfPlayers: Int {
        return registry.players.count
    }
    
    init(registry: PockerPlayerRegistry, subscriber: PockerGameSubscriber) {
        self.subscriber = subscriber
        self.registry = registry
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
        deck = deck.reset()
        registry = registry.reset()
        subscriber.didResetCardDeck(cardDeck: deck)
    }
    
    private func shuffle() {
        deck = deck.shuffle()
        subscriber.didShuffleCardDeck(cardDeck: deck)
    }
    
    private func finish() {
        subscriber.didFinishGame(game: self)
    }
    
    private func distributeCard() {
        let result = registry.distributeCard(with: deck)
        registry = result.registry
        deck = result.cardDeck
        subscriber.didDistributeCard(game: self)
    }
}

extension PockerGame: CustomStringConvertible {
    var description: String {
        return registry.description
    }
}
