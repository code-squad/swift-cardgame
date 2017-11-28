//
//  PokerGameDealer.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct PokerGameDealer {
    private let inputView: InputView

    init(inputView: InputView) {
        self.inputView = inputView
    }

    func selectGameRule() -> PokerGame.PokerRules {
        var gameRule: PokerGame.PokerRules = .none
        while gameRule == .none {
            print(PokerInputView.PokerInputGuide.pokerRules.rawValue)
            do {
                gameRule = try inputView.selectRule()
            } catch PokerInputView.PokerInputGuide.invalidRules {
                print(PokerInputView.PokerInputGuide.invalidRules.rawValue)
                continue
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
                continue
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
                continue
            }
        }
        return gameRule
    }

    func getPlayerCount() -> Int {
        var playerCount: Int = 0
        while playerCount == 0 {
            print(PokerInputView.PokerInputGuide.players.rawValue)
            do {
                playerCount = try inputView.getPlayerCount()
            } catch PokerInputView.PokerInputGuide.wrongPlayerCount {
                print(PokerInputView.PokerInputGuide.wrongPlayerCount.rawValue)
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
                continue
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
                continue
            }
        }
        return playerCount
    }

    func isMoreCard() -> Bool {
        var isMoreCard: Bool = true
        while isMoreCard {
            print(PokerInputView.PokerInputGuide.moreCard.rawValue)
            do {
                isMoreCard = try inputView.wantMoreCard()
                break
            } catch InputView.InputGuide.wrongNum {
                print(InputView.InputGuide.wrongNum.rawValue)
                continue
            } catch {
                print(InputView.InputGuide.invalidInput.rawValue)
                continue
            }
        }
        return isMoreCard
    }

}
