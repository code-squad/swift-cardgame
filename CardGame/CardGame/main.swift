//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main () {
    var dealer = Dealer()
    
    while true {
        guard let gameType = GameInputView.readGameType() else {return}
        guard let numberOfParticipant = GameInputView.readNumberOfParticipant() else {return}
        guard ValidChecker.checkContinuable(gameType: gameType.rawValue,
                                            numberOfParticipant: numberOfParticipant.rawValue,
                                            numberOfCards: dealer.numberOfDeck()) else {return}
        
        let players = dealer.distributeCard(gameType: gameType.rawValue,
                                            numberOfParticipant: numberOfParticipant.rawValue)
        
        OutputView.outputPlayers(players: players)
        OutputView.announceTheWinner(players: players)
    }
}

main()
