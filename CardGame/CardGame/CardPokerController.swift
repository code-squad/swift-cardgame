//
//  File.swift
//  CardGame
//
//  Created by 공명진 on 2019/10/01.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum PorkerGame: Int, CaseIterable {
    case sevenCard = 1
    case fiveCard = 2
}

class CardPokerController {
    
    private let cardDeck = CardDeck()
    private var players = [GamePlayer]()
    private var dealer: Dealer?
        
    func initCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
    }
    
    func reset() {
        players.removeAll()
        dealer = nil
    }
    
    func start() {
        var continueGame = true
        while (continueGame) {
            do {
                reset()
                try cardPorkerController.play()
            } catch {
                print("카드가 부족하네요.")
                continueGame = false
            }
        }
    }
    
    private func play() throws {
        let cardGameInfo = InputView.inputMenuPoker()
        if cardGameInfo.players > 4 {
            /// error
            return
        }

        do {
            for index in 0 ..< cardGameInfo.players {
                let name = "참가자#"+"\(index+1)"
                let player = GamePlayer(name: name, cards: try cards(cardGame: PorkerGame(rawValue: cardGameInfo.cardGame)!))
                players.append(player)
            }
        } catch {
            throw error
        }

        do {
            dealer = Dealer(name: "딜러", cards: try cards(cardGame: PorkerGame(rawValue: cardGameInfo.cardGame)!))
        } catch {
            throw error
        }

        describeParticipant()
    }
    
    private func cards(cardGame: PorkerGame) throws -> [Card] {
        var result = [Card]()
        let count = cardGame == .sevenCard ? 7 : 5
        for _ in 0 ..< count {
            guard let card = cardDeck.removeOne() else {
                throw CardGameError.noRemainCard
            }
            result.append(card)
        }
        return result
    }

    private func describeParticipant() {
        players.forEach { (player) in
            player.description()
        }
        dealer?.description()
        print("")
    }
}
