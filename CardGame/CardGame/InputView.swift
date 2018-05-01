//
//  InputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
   
    enum Cards: Int {
        case sevenCards = 1, fiveCards, invalidCards
    }
    
    enum Players: Int {
        case onePlayer = 1, twoPlayer, threePlayer, fourPlayer, invalidPlayer
    }
    
    func inputCard() -> Cards {
        let numberOfCards = Int(readLine() ?? "") ?? 0
        guard let cards = Cards(rawValue: numberOfCards) else { return Cards.invalidCards}
        return cards
    }
    
    func inputPlyer() -> Players {
        let numberOfPlayers = Int(readLine() ?? "") ?? 0
        guard let players = Players(rawValue: numberOfPlayers) else { return Players.invalidPlayer}
        return players
    }

}
