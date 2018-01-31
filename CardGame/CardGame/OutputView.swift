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
        case ofInsufficientCardAndResetMessage
        case ofSucceedChargingCard
        var description: String {
            switch self {
            case .ofResetCard:
                return "카드가 초기화되었습니다.\n총 52장의 카드가 있습니다."
            case .ofEndOfProgram:
                return "프로그램이 종료되었습니다."
            case .ofInsufficientCardAndResetMessage:
                return "❗️카드수가 부족합니다.❗️, 카드가 다시 충전됩니다."
            case .ofSucceedChargingCard:
                return "카드 52장이 충전되었습니다."
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
    
    
    private static func printEachCardSet (_ cards: [Card]) {
        for index in 0 ..< cards.count {
            sleep(1)
            print (cards[index].description, terminator: " ")
        }
    }
    
    static func printPlayerCardTable (_ players: [Player]) {
        for index in 0 ..< players.count {
            let cardSetInfo = players[index].getCardSetInfo()
            print ("\(cardSetInfo.name) ", terminator : "[")
            printEachCardSet(cardSetInfo.cardSet)
            print ("]")
        }
    }
    
     static func printWinner (_ winner: Player) {
        print(winner.getWinnerInfo())
    }
}
