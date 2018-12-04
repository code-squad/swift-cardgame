//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main () {
    var deck : CardGameDeck = Deck()
    let question = "다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2. 카드 섞기\n3. 카드 하나 뽑기"
    
    while true {
        let input = InputView.readInput(ment: question)
        
        switch input {
        case "1":
            deck.reset()
            print("카드 전체를 초기화했습니다.\n총 \(deck.count())장의 카드가 있습니다.\n")
        case "2":
            deck.shuffle()
            print("전체 \(deck.count())장의 카드를 섞었습니다.\n")
        case "3":
            guard let one = deck.removeOne() else {return}
            print("\(one)\n총 \(deck.count())장의 카드가 남아있습니다.\n")
        default:
            return
        }
    }
}

main()
