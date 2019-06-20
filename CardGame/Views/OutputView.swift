//
//  OutputView.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class OutputView {
    static func displayMenuResult(_ selected:GameMenu, deck: CardDeck){
        print("\(selected.getResultMessage(cardDeck: deck))")
    }
    static func printCard(_ card: Card){
        print(card)
    }
    static func displayDrawCardErrorAutoHandleMessage(){
        print(SystemMessage.autoInitializeDeck)
    }
    static func showWinner(_ winner: String){
        print(SystemMessage.gameWinner(winner))
    }
    static func showPlayersDistributedCardList (_ list: [GamePlayer]){
        let output = { (name: String, myCardDeck: [Card]) -> Void in
            print("\(name) \(myCardDeck)")
        }
        for player in list {
            player.receivePrintFormat(output)
        }
    }
}
