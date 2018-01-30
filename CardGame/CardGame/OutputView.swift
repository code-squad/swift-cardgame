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
        case ofInsufficientCard
        case ofSucceedChargingCard
        var description: String {
            switch self {
            case .ofResetCard:
                return "카드가 초기화되었습니다.\n총 52장의 카드가 있습니다."
            case .ofEndOfProgram:
                return "프로그램이 종료되었습니다."
            case .ofInsufficientCard:
                return "❗️카드수가 부족합니다.❗️, 카드를 충전해주세요."
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
    
    private static func printEachCard (_ card: Card) {
        sleep(1)
        print(card.description)
    }
    
    
    private static func printEachCardSet (_ cards: [Card]) {
        for index in 0 ..< cards.count {
            sleep(1)
            print (cards[index].description, terminator: " ")
        }
    }
    
    static func printPlayerCardTable (_ players: [Player]) {
        for index in 0 ..< players.count {
            print ("\(players[index].nameDescription) ", terminator : "[")
            printEachCardSet(players[index].cardDescription)
            print ("]")
        }
    }
    
    static func printWinner (_ players: [Player]) {
        let winner = PlayingGame.decideWinner(players)
        let WinnerHandName = PlayingGame.getWinnerHandName(point: winner.point)
        print("승자는 \(winner.name)이고 \(WinnerHandName.rawValue) \(winner.point)점 입니다.")
    }
}
