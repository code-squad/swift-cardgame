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
var dealerAction: DealerAction = DealerAction()
let outputView: OutputView = OutputView()
dealerLoop: while cardDeck.count() != 0 {
    let action = dealer.chooseAction()
    switch action {
    case .reset:
        dealerAction.reset(cardDeck: &cardDeck)
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count())장의 카드가 있습니다.")
    case .shuffle:
        dealerAction.shuffle(cardDeck: &cardDeck)
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
    case .removeOne:
        do {
            print(try dealerAction.removeOne(cardDeck: &cardDeck))
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
            continue dealerLoop
        }
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
    case .cardPacks:
        let cardPackCount: Int = dealer.selectCardPackCount()
        do {
            let cardPacks = try dealerAction.getCardPacks(cardDeck: &cardDeck, packCount: cardPackCount)
            outputView.showCardPacks(cardPacks: cardPacks)
        } catch CardDeck.CardDeckStatus.noCard {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
        }
    case .pokerGame:
        let pokerRule: PokerGame.PokerRules = dealer.selectGameRule()
        let playerCount: Int = dealer.selectPlayerCount()
        var pokerGamePlay: PokerGamePlay = PokerGamePlay.init(dealerAction: dealerAction, cardDeck: cardDeck, playerCount: playerCount, pokerRule: pokerRule)
        do {
            try pokerGamePlay.setPokerGame()
        } catch {
            print(PokerGame.GuideMessage.notEnoughCard.rawValue)
            break dealerLoop
        }
        outputView.showPokerTable(pokerGame: pokerGamePlay.pokerGame)
        let shouldMoreCard: Bool = dealer.shouldMoreCard()
        if shouldMoreCard {
            do {
                try pokerGamePlay.play(pokerRule: pokerRule)
            } catch {
                print(PokerGame.GuideMessage.notEnoughCard.rawValue)
            }
            outputView.showPokerTable(pokerGame: pokerGamePlay.pokerGame)
            outputView.showWinner(pokerGame: pokerGamePlay.pokerGame)
        }
        break dealerLoop
    case .none:
        break
    }
}

print("카드게임이 종료되었습니다.")
