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
    static func showWinner(_ winners: [String], _ type: String){
        print(SystemMessage.gameWinner(winners, type))
    }
    static func showPlayersDistributedCardList (_ list: [GamePlayer]){
        let output = { (name: String, myHand: Hand) -> Void in
            print("\(name) ", terminator: "")
            print("\(myHand.myCardDeck)")
        }
        for player in list {
            player.receivePrintFormat(output)
        }
    }
}
extension String.StringInterpolation {
    mutating func appendLiteral(cardDeck: [Card]){
        appendLiteral("[")
        appendLiteral(cardDeck.map{ (value) -> String in return value.description }.joined(separator:", "))
        appendLiteral("]")
    }
}
