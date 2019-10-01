//
//  Poker.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class Poker {
    private(set) var dealer : PokerPlayable!
    private(set) var players : [PokerPlayable]!
    private var kindOfGame: KindOfGame = .FiveCardStud
    
    init(dealer: PokerPlayable) {
        self.dealer = dealer
        self.players = []
    }
    
    deinit {
        end()
    }
    
    func changeDealer(dealer: PokerPlayable) {
        self.dealer = dealer
    }
    
    func addPlayer(player: PokerPlayable) {
        self.players.append(player)
    }
    
    
    func prepare(kindOfGame: KindOfGame) {
        self.kindOfGame = kindOfGame
        (dealer as! Dealer).shuffleCardDeck()
    }
    
    func play(printCard: ((PokerPlayable)->Void)?, printMessage: (String)->Void?) {
        let dealer = self.dealer as! Dealer
        let numberOfPlayers = 1 + self.players.count
        
        for _ in 1...self.kindOfGame.numberOfCards {
            if (dealer.canDealingCard(numberOfPlayers: numberOfPlayers)) {
                printMessage("")
                for player in self.players {
                    dealer.giveCard(to: player)
                    printCard?(player)
                }
                dealer.giveCard(to: dealer)
                printCard?(dealer)
                
                usleep(100000)
            }
        }
    }
    
    func result() throws -> PokerPlayable {
        var allPlayers : [PokerPlayable]
        allPlayers = []
        allPlayers.append(self.dealer)
        allPlayers.append(contentsOf: self.players)
        
        func sortForScore(lhs:PokerPlayable, rhs:PokerPlayable) throws -> Bool {
            do {
                let lScore = try lhs.hands().score
                let rScore = try rhs.hands().score
                
                return lScore > rScore
            }
            catch let error {
                throw error
            }
            
        }
        // 클로저와 try 를 같이 사용하려면 어떻게 해야할까.
        try allPlayers.sort(by: sortForScore)
        return allPlayers[0]
    }
    
    func end() {
        self.dealer.giveBackCardAll()
        for player in self.players {
            player.giveBackCardAll()
        }
    }
    
}
