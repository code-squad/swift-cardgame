//
//  main.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let inputView: InputView = InputView()
var dealer: Dealer = Dealer.init(inputView: inputView)
var dealerAction: DealerAction = DealerAction()
let outputView: OutputView = OutputView()
dealerLoop: while dealerAction.isRemain() {
    let action = dealer.chooseAction()
    switch action {
    case .reset:
        dealerAction.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(dealerAction.count())장의 카드가 있습니다.")
    case .shuffle:
        dealerAction.shuffle()
        print("전체 \(dealerAction.count())장의 카드를 섞었습니다.")
    case .removeOne:
        guard let deletedCard = dealerAction.removeOne() else {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
            continue dealerLoop
        }
        print(deletedCard)
        print("총 \(dealerAction.count())장의 카드가 남아있습니다.")
    case .cardPacks:
        let cardPackCount: Int = dealer.selectCardPackCount()
        let cardPacks = dealerAction.getCardPacks(packCount: cardPackCount)
        if cardPacks.count > 0 {
            outputView.showCardPacks(cardPacks: cardPacks)
        } else {
            print(CardDeck.CardDeckStatus.noCard.rawValue)
        }
    case .pokerGame:
        let pokerRule: PokerGame.PokerRules = dealer.selectGameRule()
        let playerCount: Int = dealer.selectPlayerCount()
        var pokerGame: PokerGame = PokerGame.init(dealerAction: dealerAction, playerCount: playerCount, pokerRule: pokerRule)
        guard pokerGame.setPokerGame() else {
            print(PokerGame.GuideMessage.notEnoughCard.rawValue)
            break dealerLoop
        }
        let gameOutputView: GameOutputView = GameOutputView(pokerGame: pokerGame)
        gameOutputView.showPokerTable()
        let shouldMoreCard: Bool = dealer.shouldMoreCard()
        guard shouldMoreCard && pokerGame.play() else {
            print(PokerGame.GuideMessage.notEnoughCard.rawValue)
            break dealerLoop
        }
        gameOutputView.showPokerTable()
        gameOutputView.showWinner()
        break dealerLoop
    case .none:
        break
    }
}

print("카드게임이 종료되었습니다.")
