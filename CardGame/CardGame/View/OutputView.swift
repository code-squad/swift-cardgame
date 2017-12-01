//
//  OutputView.swift
//  CardGame
//
//  Created by 심 승민 on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {

    static func printCardStacks(by dealer: Dealer) {
        for (index, stack) in dealer.cardStacks.enumerated() {
            guard index < dealer.cardStacks.endIndex-1 else {
                print("딜러\t\t\(stack)")
                continue
            }
            print("참가자#\(index+1)\t\(stack)")
        }
    }

    static func printResult(of gameMenu: Dealer.GameMenu?, using deck: Deck, _ cardSelected: Card?) {
        guard let menu = gameMenu else { return }
        switch menu {
        case .reset:
            print("카드 전체를 초기화했습니다.\n총 \(deck.count)장의 카드가 있습니다.")
        case .shuffle:
            if deck.count == 52 {
                print("전체 52장의 카드를 섞었습니다.")
            }else {
                print("\(deck.count)장의 카드를 섞었습니다.")
            }
        case .remove:
            guard let selectedCard = cardSelected else { break }
            print(selectedCard.description)
            print("총 \(deck.count)장의 카드가 남아있습니다.")
        }
    }

    static func printCardStacks(by dealer: Dealer) {
        for stack in dealer.cardStacks {
            print(stack)
        }
    }

}
