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
        let numberOfParticipant = GameInputView.readNumberOfParticipant()
        guard ValidChecker.check(numberOfParticipant: numberOfParticipant) else {return}
        guard ValidChecker.checkContinuable(gameType: gameType.rawValue,
                                            numberOfParticipant: numberOfParticipant,
                                            numberOfCards: Dealer.numberOfDeck()) else {return}
        
        let players = Dealer.distributeCard(gameType: gameType.rawValue, numberOfParticipant: numberOfParticipant)
        
        OutputView.outputPlayers(players: players)
    }
}

main()
