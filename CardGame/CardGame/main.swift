//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    var deck = Deck()
    while true {
        do {
            let inputMenu =
                try InputView.askFor(message:"""
                                            다음 메뉴를 선택해주세요.
                                            1. 카드 초기화
                                            2. 카드 섞기
                                            3. 카드 하나 뽑기
                                            >
                                            """)
            guard let userInput = inputMenu else { break }
            let selectedCard = try Dealer.start(userInput, with: &deck)
            OutputView.printResult(of: userInput, using: deck, selectedCard)
        }catch {
            print(error)
        }
    }
}

main()
