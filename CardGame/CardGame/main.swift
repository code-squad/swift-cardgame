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
var dealer: Dealer = Dealer.init(inputView: inputView)
let outputView: OutputView = OutputView()
dealerLoop: while cardDeck.count() != 0 {
    let action = dealer.chooseAction()
    switch action {
    case .reset:
        cardDeck = dealer.dealerAction.reset(cardDeck: &cardDeck)
    case .shuffle:
        cardDeck = dealer.dealerAction.shuffle(cardDeck: &cardDeck)
    case .removeOne:
        do {
            cardDeck = try dealer.dealerAction.removeOne(cardDeck: &cardDeck)
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
            continue dealerLoop
        }
    case .cardPacks:
        let cardPackCount: Int = dealer.selectCardPackCount()
        do {
            let cardPacks = try dealer.dealerAction.getCardPacks(cardDeck: &cardDeck, packCount: cardPackCount)
            outputView.showCardPacks(cardPacks: cardPacks)
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
        }
    case .pokerGame:
        var pokerGamePlay: PokerGamePlay = PokerGamePlay(dealer: dealer, cardDeck: cardDeck)
        let pokerGame = pokerGamePlay.setPokerGame()
        outputView.showPokerTable(pokerGame: pokerGame)
        if pokerGamePlay.play() {
            outputView.showPokerTable(pokerGame: pokerGame)
            outputView.showWinner(pokerGame: pokerGame)
        }
        break dealerLoop
    case .none:
        break
    }
}

print("카드게임이 종료되었습니다.")
