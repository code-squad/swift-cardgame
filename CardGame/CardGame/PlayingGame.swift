//
//  PlayingGame.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PlayingGame {
    static func runGame (_ participant: CardGameInfo.NumberOfParticipants, _ gameSpecies: CardGameInfo.GameSpecies) -> (players: [Player], remainCard: Int) {
        var participants = [Player]()
        var dealer = Dealer(CardDeck())
        for index in 0 ..< participant.rawValue {
            let player = Player(index+1, dealer.dealCards(gameSpecies))
            participants.append(player)
        }
        let dealerAsPlayer = Player(dealer: dealer, nameIndex: participant.rawValue + 1, cardSet: dealer.dealCards(gameSpecies))
        participants.append(dealerAsPlayer)
        return (participants, dealer.remainedCard)
    }
    
    static func decideWinner (_ players: [Player]) -> (name: String, point: Int) {
        let sortedPlayer = players.sorted(by: >)
        guard sortedPlayer[0] == sortedPlayer[1]  else { return (sortedPlayer[0].nameDescription, sortedPlayer[0].pointDescription)}
        let realWinner = getWinnerBetweenSamePointUsers(players)
        return (realWinner.nameDescription, realWinner.pointDescription )
    }
    
    static func getWinnerHandName (point: Int) -> Hand.HandRanks {
        return Hand.getHandName(point: point) ?? Hand.HandRanks.fullHouse
    }

    private static func getWinnerBetweenSamePointUsers (_ players: [Player]) -> Player {
        let playerATopCard = Hand.getTopCard(cards: players[0].cardDescription)
        let playerBTopCard = Hand.getTopCard(cards: players[1].cardDescription)
        print(playerATopCard,playerBTopCard)
        return playerATopCard > playerBTopCard ? players[0] : players[1]
    }
    
    static func isGameRunnable (_ cardGameInfo: CardGameInfo, _ remainCard: Int) -> Bool {
        return remainCard > (cardGameInfo.numberOfPlayers.rawValue + 1) * cardGameInfo.numberOfCards.rawValue
    }

}

