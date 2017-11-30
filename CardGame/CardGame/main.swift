//
//  main.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

var cardDeck: CardDeck = CardDeck()
let inputView: InputView = InputView()
let dealer: Dealer = Dealer.init(inputView: inputView)
var dealerAction: DealerAction = DealerAction()
let outputView: OutputView = OutputView()
dealerLoop: while cardDeck.count() != 0 {
    let action: DealerAction.CardAction = dealer.chooseAction()
    switch action {
    case .reset:
        cardDeck = dealerAction.reset(cardDeck: &cardDeck)
    case .shuffle:
        cardDeck = dealerAction.shuffle(cardDeck: &cardDeck)
    case .removeOne:
        do {
            cardDeck = try dealerAction.removeOne(cardDeck: &cardDeck)
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
            continue dealerLoop
        }
    case .cardPacks:
        let cardPackCount: Int = dealer.getCardPackCount()
        do {
            let cardPacks = try dealerAction.getCardPacks(cardDeck: &cardDeck, packCount: cardPackCount)
            outputView.showCardPacks(cardPacks: cardPacks)
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
        }
    case .pokerGame:
        let pokerRule: PokerGame.PokerRules = dealer.selectGameRule()
        let playerCount: Int = dealer.getPlayerCount()
        var pokerGame: PokerGame = PokerGame.init(cardDeck: cardDeck, playerCount: playerCount, pokerRule: pokerRule)
        pokerGame = dealerAction.setPokerGame(pokerGame: &pokerGame)
        outputView.showPokerTable(pokerGame: pokerGame)
        var shouldMoreCard: Bool = true
        while shouldMoreCard {
            shouldMoreCard = dealer.shouldMoreCard()
            guard shouldMoreCard else {
                break dealerLoop
            }
            do {
                try pokerGame.nextTurn()
            } catch PokerGame.GuideMessage.notEnoughCard {
                print(PokerGame.GuideMessage.notEnoughCard.rawValue)
                break dealerLoop
            }
            outputView.showPokerTable(pokerGame: pokerGame)
        }
    case .none:
        break
    }
}

print("카드게임이 종료되었습니다.")
