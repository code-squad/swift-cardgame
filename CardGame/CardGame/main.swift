//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

class Game {
    var deck: CardDeck
    
    init() {
        let cards = CardDeckGenerator.generateCards()
        self.deck = CardDeck(cards: cards)
    }
    
    func play() {
        deck.shuffle()
        do {
            while deck.total >= 15 {
                guard let result = try playRound() else { break }
                OutputView.display(CardGameResult.players(result))
            }
        }catch let err as CardGameError {
            OutputView.display(err)
        }catch {
            OutputView.display(.unknown)
        }
    }
    
    private func playRound() throws -> [Player]? {
        let picked = try InputView<GameCategory>.read()
        let player = try InputView<GamePlayerCategory>.read()
        
        let required = picked.count * (player.count + 1)
        
        if deck.total < required {
            return nil
        }
        
        var players: [Player] = []
        
        for _ in 0..<player.count {
            players.append(Player(.player, with: deck.remove(picked.count)))
        }
        players.append(Player(.dealer, with: deck.remove(picked.count)))
        
        return players
    }
}

Game().play()
