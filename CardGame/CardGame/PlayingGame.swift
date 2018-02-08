//
//  PlayingGame.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct PlayingGame {
    private var players:[ Player] = [Player]()
    private var numberOfParticipants: NumberOfParticipants = .two
    private var kindOfGame: KindOfGame = .fiveCard
    private var dealer: Dealer
    init(_ numberOfParticipants: NumberOfParticipants, _ kindOfGame: KindOfGame, _ dealer: Dealer) {
        self.kindOfGame = kindOfGame
        self.numberOfParticipants = numberOfParticipants
        self.dealer = dealer
        self.players = runGame(numberOfParticipants, kindOfGame, dealer)
    }
    
    static func isRunnable(_ numberOfParticipants: NumberOfParticipants, _ kindOfGame: KindOfGame, _ dealer: Dealer) -> Bool {
        return dealer.haveEnoughCards(neededCards(numberOfParticipants, kindOfGame))
    }
    
    mutating func runGame(_ numberOfParticipants: NumberOfParticipants, _ kindOfGame: KindOfGame, _ dealer: Dealer) ->  [Player] {
        for index in 0 ..< numberOfParticipants.rawValue {
            let player = Player(index+1, dealer.dealCards(kindOfGame))
            players.append(player)
        }
        let dealerAsPlayer = Player(dealer: dealer, nameIndex: numberOfParticipants.rawValue + 1, cardSet: dealer.dealCards(kindOfGame))
        players.append(dealerAsPlayer)
        return players
    }
    
    private static func neededCards (_ numberOfParticipants: NumberOfParticipants, _ kindOfGame: KindOfGame) -> Int {
        return (numberOfParticipants.rawValue + 1) * kindOfGame.rawValue
    }
    
    func decideWinner () -> Player {
        let sortedPlayer = players.sorted(by: >)
        guard sortedPlayer[0] == sortedPlayer[1]  else { return (sortedPlayer[0]) }
        return selectWinnerBetweenSamePointUsers()
    }
    
    static func getWinnerHandName (point: Int) -> Hand.HandRanks {
        return Hand.getHandName(point: point) ?? Hand.HandRanks.fullHouse
    }
    
    private func selectWinnerBetweenSamePointUsers () -> Player {
        let topCardOfPlayerA = players[0].getTopCard()
        let topCardOfPlayerB = players[1].getTopCard()
        return topCardOfPlayerA > topCardOfPlayerB ? players[0] : players[1]
    }
    
    func cardSetOfPlayers () {
        for index in 0 ..< self.numberOfParticipants.rawValue + 1 {
            players[index].makeCardSetOfPlayer()
        }
    }
//    func cardSetOfPlayerss() {
//        for index in 0 ..< self.players.count {
//            print (players[index].firstStepOfCard(), terminator: " ")
//            print (players[index].randomCard(), terminator: " ")
//            print ("]")
//        }
//    }
    
}
