//
//  Dealer.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 30..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Dealer {
    private let inputView: InputView

    init(inputView: InputView) {
        self.inputView = inputView
    }

    func chooseAction() -> DealerAction.CardAction {
        var selectedAction: DealerAction.CardAction = .none
        while selectedAction == .none {
            do {
                print(InputView.InputGuide.menu.rawValue)
                selectedAction = try inputView.readInput()
            } catch InputView.InputGuide.invalidInput {
                print(InputView.InputGuide.invalidInput.rawValue)
            }  catch InputView.InputGuide.invalidCardAction {
                print(InputView.InputGuide.invalidCardAction.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return selectedAction
    }

    func getCardPackCount() -> Int {
        var cardPackCount: Int = 0
        while cardPackCount == 0 {
            do {
                print(InputView.InputGuide.cardPackCountGuide.rawValue)
                cardPackCount = try inputView.getPackCount()
            } catch InputView.InputGuide.wrongPackCount {
                print(InputView.InputGuide.wrongPackCount.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return cardPackCount
    }

}

typealias PokerGameDealer = Dealer

extension PokerGameDealer {

    func selectGameRule() -> PokerGame.PokerRules {
        var gameRule: PokerGame.PokerRules = .none
        while gameRule == .none {
            do {
                print(PokerInputView.PokerInputGuide.pokerRules.rawValue)
                gameRule = try inputView.selectRule()
            } catch PokerInputView.PokerInputGuide.invalidRules {
                print(PokerInputView.PokerInputGuide.invalidRules.rawValue)
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return gameRule
    }

    func getPlayerCount() -> Int {
        var playerCount: Int = 0
        while playerCount == 0 {
            do {
                print(PokerInputView.PokerInputGuide.players.rawValue)
                playerCount = try inputView.getPlayerCount()
            } catch PokerInputView.PokerInputGuide.wrongPlayerCount {
                print(PokerInputView.PokerInputGuide.wrongPlayerCount.rawValue)
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return playerCount
    }

    func shouldMoreCard() -> Bool {
        var shouldMoreCard: Bool = true
        while shouldMoreCard {
            do {
                print(PokerInputView.PokerInputGuide.moreCard.rawValue)
                shouldMoreCard = try inputView.shouldMoreCard()
                break
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return shouldMoreCard
    }

}
