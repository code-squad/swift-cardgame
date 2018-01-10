//
//  OutputView.swift
//  CardGame
//
//  Created by jack on 2018. 1. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    enum Messages : String {
        case inputMessage = "다음 메뉴를 선택해주세요.\n1. 카드 초기화\n2. 카드 섞기\n3. 카드 하나 뽑기\n4. 종료"
        case resetMessage = "카드 전체를 초기화했습니다.\n총 52장의 카드가 있습니다."
        case invalidMenu = "잘못된 메뉴입니다. 다시 입력해주세요."
        case exitCardGame = "카드게임을 종료하겠습니다."
        case gameSpecies = "카드 게임 종류를 선택하세요.\n1. 7카드\n2. 5카드"
        case playersInput = "참여할 사람의 인원을 입력하세요."
        case lackOfCards = "카드의 수가 부족합니다."
        case exceedMessage = "참여자는 최대 4명입니다. 처음부터 다시 입력해주세요."
    }
    
    func printMessage (_ oneMessage : Messages) {
        print(oneMessage.rawValue)
    }
    
    func printRemaingCards(_ userDeck : CardDeck) {
        print("총 \(userDeck.count())장의 카드가 남아있습니다.")
    }
    
    func printShuffleMessage(_ userDeck : CardDeck) {
        print("전체 \(userDeck.count())장의 카드를 섞었습니다.")
    }
    
    func printStacks(_ stacks : [[Card]]) {
        for indexOfStacks in 0..<stacks.count {
            print(stacks[indexOfStacks])
        }
    }
    
    func printPlayerCards(_ stacks : [[Card]]) {
        for indexOfStacks in 0..<(stacks.count - 1){
            print("참가자#\(indexOfStacks + 1)", stacks[indexOfStacks])
        }
        print("딜러", stacks[stacks.count - 1])
    }

}
