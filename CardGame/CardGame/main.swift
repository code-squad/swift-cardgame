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
//    let help = "다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n> "
//    var ment = ""
    
    deck.shuffle()
    for number in 1...7 {
        let drawnCards = deck.draw(few: number)
        CardGameSetter.printSetting(with: drawnCards)
    }
    
    //처음에는 기존 기능을 다른 함수로 만들어서 뺀다음에 호출하는 부분을 잠시 없애는 방법도 생각해보고
    //일시적으로 main()말고 다른 함수를 만들어서 해볼까 생각도 해봤는데
    //주석이 괜찮은 것 같아 주석으로 하였습니다.
    //약간의 살짝 아주 조금의 방향만 제시해주시면 다시 해보겠습니다!! ㅠ
//    while true {
//        let input = InputView.readInput(ment: help)
//
//        switch input {
//        case "1":
//            deck.reset()
//            ment = "카드 전체를 초기화했습니다.\n총 \(deck.count())장의 카드가 있습니다.\n"
//        case "2":
//            deck.shuffle()
//            ment = "전체 \(deck.count())장의 카드를 섞었습니다.\n"
//        case "3":
//            guard let one = deck.removeOne() else {return}
//            ment = "\(one)\n총 \(deck.count())장의 카드가 남아있습니다.\n"
//        default:
//            return
//        }
//
//        OutputView.outputState(ment: ment)
//    }
}

main()
