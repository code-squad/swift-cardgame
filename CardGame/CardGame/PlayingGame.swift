//
//  PlayingGame.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PlayingGame {
    private (set) var players = [Player]()
    private (set) var remainCard = 0
    init(_ participant: CardGameInfo.NumberOfParticipants, _ gameSpecies: CardGameInfo.GameSpecies) {
        let resultGame = runGame(participant, gameSpecies)
        self.players = resultGame.players
        self.remainCard = resultGame.remainCard
    }
    mutating func runGame (_ participant: CardGameInfo.NumberOfParticipants, _ gameSpecies: CardGameInfo.GameSpecies) -> (players: [Player], remainCard: Int) {
        var dealer = Dealer(CardDeck())
        for index in 0 ..< participant.rawValue {
            let player = Player(index+1, dealer.dealCards(gameSpecies))
            players.append(player)
        }
        let dealerAsPlayer = Player(dealer: dealer, nameIndex: participant.rawValue + 1, cardSet: dealer.dealCards(gameSpecies))
        players.append(dealerAsPlayer)
        return (players, dealer.remainedCard)
    }
    
     func decideWinner () -> Player {
        let sortedPlayer = players.sorted(by: >)
        guard sortedPlayer[0] == sortedPlayer[1]  else { return (sortedPlayer[0]) }
        return getWinnerBetweenSamePointUsers()
    }
    
    static func getWinnerHandName (point: Int) -> Hand.HandRanks {
        return Hand.getHandName(point: point) ?? Hand.HandRanks.fullHouse
    }

     func getWinnerBetweenSamePointUsers () -> Player {
        let playerATopCard = players[0].getTopCard()
        let playerBTopCard = players[1].getTopCard()
        return playerATopCard > playerBTopCard ? players[0] : players[1]
    }
    
    static func isGameRunnable (_ cardGameInfo: CardGameInfo, _ remainCard: Int) -> Bool {
        return remainCard > (cardGameInfo.numberOfPlayers.rawValue + 1) * cardGameInfo.numberOfCards.rawValue
    }

}

