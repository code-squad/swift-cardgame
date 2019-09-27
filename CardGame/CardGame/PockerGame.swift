//
//  CommandExecutor.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PockerGameSubscriber {
    func didDistributeCard(card: Card, from cardDeck: CardDeck, to player: String)
    func didResetCardDeck(cardDeck: CardDeck)
    func didShuffleCardDeck(cardDeck: CardDeck)
}

class PockerGame: CommandReceiverable, CustomStringConvertible {
    
    private var deck: CardDeck
    private let subscriber : PockerGameSubscriber
    private var players: [PockerPlayer]
    
    init(players:[PockerPlayer], subscriber: PockerGameSubscriber) {
        self.subscriber = subscriber
        self.players = players
        self.deck = CardDeck()
    }
    
    func onReceive(command: Command) {
        switch command {
        case .reset      : reset()
        case .shuffle    : shuffle()
        case .distribute : distributeCard()
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
    
    private func distributeCard() {
        for i in 0..<players.count {
            let card = deck.removeOne()
            players[i].addCard(card: card)
            subscriber.didDistributeCard(card: card, from: deck, to: players[i].name)
        }
    }
    
    var description: String {
        return players.map { $0.description }.joined(separator: "\n")
    }
}

