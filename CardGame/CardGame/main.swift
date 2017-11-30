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
    while true {
        do {
            guard let userInput = try InputView.askFor(message: demand) else { break }
            let selectedCard = try dealer.start(userInput)
            OutputView.printResult(of: userInput, using: dealer.deck, selectedCard)
        }catch {
            print(error)
        }
    }
}

main()
