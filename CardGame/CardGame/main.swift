//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main () {
    var deck : CardGameDeck = Deck()
    deck.shuffle()
    
    while true {
        let gameType = GameInputView.readGameType()
        guard ValidChecker.check(gameType: gameType) else {return}
        let numberOfParticipant = GameInputView.readNumberOfParticipant()
        guard ValidChecker.check(numberOfParticipant: numberOfParticipant) else {return}
        
        
    }
}

main()
