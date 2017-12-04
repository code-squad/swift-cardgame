//
//  Dealer.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 30..
//  Copyright © 2017 ChocOZerO. All rights reserved.
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
            print(InputView.InputGuide.menu.rawValue)
            do {
                selectedAction = try inputView.readInput()
            } catch InputView.InputGuide.invalidInput {
                print(InputView.InputGuide.invalidInput.rawValue)
            } catch InputView.InputGuide.invalidCardAction {
                print(InputView.InputGuide.invalidCardAction.rawValue)
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
            }
        }
        return selectedAction
    }

    func selectCardPackCount() -> Int {
        var cardPackCount: Int = 0
        while cardPackCount == 0 {
            print(InputView.InputGuide.cardPackCountGuide.rawValue)
            do {
                cardPackCount = try inputView.selectCardPackCount()
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
            print(PokerInputView.PokerInputGuide.pokerRules.rawValue)
            do {
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

    func selectPlayerCount() -> Int {
        var playerCount: Int = 0
        while playerCount == 0 {
            print(PokerInputView.PokerInputGuide.players.rawValue)
            do {
                playerCount = try inputView.selectPlayerCount()
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
            print(PokerInputView.PokerInputGuide.moreCard.rawValue)
            do {
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
