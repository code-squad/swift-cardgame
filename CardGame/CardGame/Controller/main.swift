//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

enum CardGameError : Error {
    case invalidMenumNumber
    case emptyCardDeck
}

enum KindOfGame {
    case SevenCardStud
    case FiveCardStud
    
    var numberOfCards : Int {
        switch self {
        case .SevenCardStud :
            return 7
            
        case .FiveCardStud :
            return 5
        }
    }
}

func inputValueValidator(userInput: String, menu: Menu) throws -> Int {
    // pasing
    let choiceTrimmed = userInput.filter { !$0.isNewline && !$0.isWhitespace }
    guard let choosenMenu = Int(choiceTrimmed) else {
        throw CardGameError.invalidMenumNumber
    }
    
    switch menu {
    case .cardDeckTest :
        guard choosenMenu >= 1 && choosenMenu <= 3 else {
            throw CardGameError.invalidMenumNumber
        }
    case .kindOfGame :
        guard choosenMenu >= 1 && choosenMenu <= 2 else {
            throw CardGameError.invalidMenumNumber
        }
        
    case .numberOfPlayer :
        guard choosenMenu >= 1 && choosenMenu <= 4 else {
            throw CardGameError.invalidMenumNumber
        }
    }
    
    return choosenMenu
}

func getKindOfGame(chooseMenu: Int) throws -> KindOfGame{
    switch chooseMenu {
    case 1 :
        return .FiveCardStud
    case 2 :
        return .SevenCardStud
    default :
        throw CardGameError.invalidMenumNumber
    }
}

func main() {
    let cardGameInput = CardGameInput()
    let cardDeck = CardDeck()
    
    do {
        // user input
        var userInput = InputView.readChoice(inputReadable: cardGameInput, message: Menu.kindOfGame)
        let choosenMenu = try inputValueValidator(userInput: userInput, menu: Menu.kindOfGame)
        let kindOfGame = try getKindOfGame(chooseMenu: choosenMenu)
        
        userInput = InputView.readChoice(inputReadable: cardGameInput, message: Menu.numberOfPlayer)
        let numberOfPlayer = try inputValueValidator(userInput: userInput, menu: Menu.numberOfPlayer)
        
        let dealer = PokerParticipantFactory.make(name: "딜러", cardDeck: cardDeck)
        let poker = Poker(dealer: dealer)
        
        for index in 1...numberOfPlayer {
            poker.addPlayer(player: PokerParticipantFactory.make(name: "참가자#\(index)"))
        }
        
        poker.prepare(kindOfGame: kindOfGame)
        poker.play()
        
        OutputView.showPlayerCards(players: poker.players)
        OutputView.showPlayerCards(player: dealer as PokerPlayable)
        
        //print(cardDeck)
        
    }
    catch let error {
        print(error)
    }

}

main()







