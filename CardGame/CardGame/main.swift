//
//  main.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 24..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

var cardDeck: CardDeck = CardDeck()
var selectedAction: CardAction = .none
let inputView: InputView = InputView()
let gameTable: GameTable = GameTable()
cardGameLoop: while (selectedAction == .none) || (cardDeck.count() != 0) {
    print(InputView.InputGuide.menu.rawValue)
    do {
        selectedAction = try inputView.readInput()
    } catch InputView.InputGuide.invalidInput {
        print(InputView.InputGuide.invalidInput.rawValue)
        continue
    }  catch InputView.InputGuide.invalidCardAction {
        print(InputView.InputGuide.invalidCardAction.rawValue)
        continue
    }
    switch selectedAction {
    case .reset:
        cardDeck.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cardDeck.count())장의 카드가 있습니다.")
    case .shuffle:
        cardDeck.shuffle()
        print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
    case .removeOne:
        let deletedCard: Card = cardDeck.removeOne()
        print(deletedCard)
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
    case .cardPacks:
        var packCount: Int = 0
        cardPacksLoop: while packCount == 0 {
            do {
                print("원하는 카드 팩의 갯수를 선택하세요.(1~9)")
                packCount = try inputView.getPackCount()
                let cardPacks = cardDeck.getCardPacks(packCount: packCount)
                gameTable.showTable(cardPacks: cardPacks)
                break cardGameLoop
            } catch InputView.InputGuide.wrongPackCount {
                print(InputView.InputGuide.wrongPackCount.rawValue)
                continue cardPacksLoop
            }
        }
    case .game:
        var gameRule: PokerRules = .none
        let gameInputView: GameInputView = GameInputView()
        gameRuleLoop: while gameRule == .none {
            print(GameInputView.InputGuide.pokerRules.rawValue)
            do {
                gameRule = try gameInputView.selectRule()
                var playerCount: Int = 0
                playerLoop: while playerCount == 0 {
                    print(GameInputView.InputGuide.players.rawValue)
                    do {
                        playerCount = try gameInputView.getPlayerCount()
                        print("playerCount: \(playerCount)")
                        break cardGameLoop
                    } catch GameInputView.InputGuide.wrongPlayerCount {
                        print(GameInputView.InputGuide.wrongPlayerCount.rawValue)
                    }
                }
            } catch GameInputView.InputGuide.invalidInput {
                print(GameInputView.InputGuide.invalidInput.rawValue)
                continue gameRuleLoop
            }
        }
    case .none:
        break
    }
}

print("카드게임이 종료되었습니다.")
