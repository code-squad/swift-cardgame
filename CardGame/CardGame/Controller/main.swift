//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func main() {
    let cardGameInput = CardGameInput()
    let cardDeck = CardDeck()
    
    do {
        // user input for kind of game
        var userInput = InputView.readChoice(inputReadable: cardGameInput, message: Menu.kindOfGame)
        let choosenMenu = try Utility.inputValueValidator(userInput: userInput, menu: Menu.kindOfGame)
        let kindOfGame = try Utility.getKindOfGame(chooseMenu: choosenMenu)
        
        // user input for number of players
        userInput = InputView.readChoice(inputReadable: cardGameInput, message: Menu.numberOfPlayer)
        let numberOfPlayer = try Utility.inputValueValidator(userInput: userInput, menu: Menu.numberOfPlayer)
        
        // make dealer
        let dealer = PokerParticipantFactory.make(name: "딜러", cardDeck: cardDeck)
        // make poker game
        let poker = Poker(dealer: dealer)
        
        // add players to poker game
        for index in 1...numberOfPlayer {
            poker.addPlayer(player: PokerParticipantFactory.make(name: "참가자#\(index)"))
        }
        
        // play poker
        poker.prepare(kindOfGame: kindOfGame)
        poker.play(output: OutputView.showPlayerCards(player:))
        let winner = try poker.result()
        
        try OutputView.showWinnder(winner: winner)
        
        
        // result
        //OutputView.showPlayerCards(players: poker.players)
        //OutputView.showPlayerCards(player: dealer as PokerPlayable)
        
        //print(cardDeck)
        
    }
    catch let error {
        print(error)
    }

}

main()







