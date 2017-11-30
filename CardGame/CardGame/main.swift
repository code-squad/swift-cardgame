//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    let deck = Deck()
    var dealer = Dealer(deck: deck)
    let demand = """
                    다음 메뉴를 선택해주세요.
                    1. 카드 초기화
                    2. 카드 섞기
                    3. 카드 하나 뽑기
                    >
                    """
    let pilesCount = 7
    while true {
        guard let inputMenu = try? InputView.askFor(message: demand) else { break }
        var selectedCard: Card?
        do {
            selectedCard = try dealer.start(inputMenu)
        }catch {
            print(error)
        }
        OutputView.printResult(of: inputMenu, using: dealer.deck, selectedCard)
        // 기능 제거를 따로 하진 않았고, 메뉴 선택 시 결과 밑에 스택 출력.
        dealer.setCardStack(of: pilesCount)
        OutputView.printCardStacks(by: dealer)
    }
}

main()
