//
//  OutputView.swift
//  CardGame
//
//  Created by Choi Jeong Hoon on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct OutputView {
    private let playingGame: PlayingGame
    private let dealer: Dealer
    init(_ playingGame: PlayingGame, _ dealer: Dealer) {
        self.playingGame = playingGame
        self.dealer = dealer
    }
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
                return "❗️카드수가 부족합니다.❗️, 프로그램이 종료됩니다.."
            case .ofSucceedChargingCard:
                return "카드 52장이 충전되었습니다."
            }
        }
    }
    
    static func printOfEndOfProgramMessage() {
        print (Message.ofEndOfProgram)
    }
    
    static func printOfInsufficientCard() {
        print (Message.ofInsufficientCard)
    }
    
     func printWinner() {
        print (playingGame.decideWinner().getWinnerInfo())
    }
    
     func printRemainingCards() {
        print(dealer.noticeRemainCard())
    }
    
     func printCardsOfPlayers() {
        playingGame.cardSetOfPlayers()
    }
}
