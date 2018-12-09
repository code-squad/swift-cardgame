//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main () {
    while true {
        guard let gameType = GameInputView.readGameType() else {return}
        guard let numberOfParticipant = GameInputView.readNumberOfParticipant() else {return}
        guard ValidChecker.checkContinuable(gameType: gameType.rawValue,
                                            numberOfParticipant: numberOfParticipant.rawValue,
                                            numberOfCards: Dealer.numberOfDeck()) else {return}
        
        let players = Dealer.distributeCard(gameType: gameType.rawValue,
                                            numberOfParticipant: numberOfParticipant.rawValue)
        
        OutputView.outputPlayers(players: players)
        
        let winner = players.max { playerA, playerB in playerA.score() < playerB.score()}
        guard let winnerDescription = winner?.description else {return}
        
        OutputView.announceTheWinner(winnerDescription)
    }
}

main()
