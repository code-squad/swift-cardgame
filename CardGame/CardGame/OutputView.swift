//
//  OutputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct OutputView {
    enum Message: CustomStringConvertible{
        case ofResetCard
        case ofEndOfProgram
        var description: String {
            switch self {
            case .ofResetCard:
                return "카드가 초기화되었습니다.\n총 52장의 카드가 있습니다."
            case .ofEndOfProgram:
                return "프로그램이 종료되었습니다."
            }
        }
    }
    
    static func printOfResetMessage () {
        print (Message.ofResetCard)
    }
    
    static func printOfEndOfProgramMessage () {
        print (Message.ofEndOfProgram)
    }
    
    static func printShuffle (_ cardDeck: CardDeck) {
        print ("전체 \(cardDeck.count)장의 카드를 섞었습니다. ")
    }
    
    static func printPickCard (_ cardDeck: CardDeck) {
        print("총 \(cardDeck.count)장의 카드가 남아있습니다.")
    }
}
