//
//  PlayCardGame.swift
//  CardGame
//
//  Created by 윤동민 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct PlayCardGame {
    // 게임을 실행
    static func playGame(with cardDeck: CardDeck, who dealar: Dealer) {
        var menuInput : String
        var playerInput: Int
        repeat {
            menuInput = GameInputView.inputMenu(message: "카드 게임 종류를 선택하세요.")
            playerInput = GameInputView.inputPlayer(message: "참여할 사람의 인원을 입력하세요.")
        }while !checkMenu(of: menuInput) || !checkPlayer(of: playerInput)
        excuteByMenu(by: ChoiceMenu(rawValue: menuInput), to: ChoiceParticipate(rawValue: playerInput), with: cardDeck, who: dealar)
    }
    
    // 메뉴에 있는 선택지인지 확인
    static private func checkMenu(of menu: String) -> Bool {
        guard menu == "1" || menu == "2" else { return false }
        return true
    }
    
    // 지원하는 플레이어 수인지 확인
    static private func checkPlayer(of number: Int) -> Bool {
        guard number > 0 && number < 5 else { return false }
        return true
    }
    
    // 메뉴에 따라 패를 플레이어에게 나눌 수 있게 구현
    static private func excuteByMenu(by choiceMenu: ChoiceMenu?, to choicePlayer: ChoiceParticipate?, with deck: CardDeck, who dealer: Dealer) {
        guard let menu = choiceMenu else { return }
        guard let player = choicePlayer else { return }
        let players: Players = Players()
        players.makePlayer(by: player, dealer)
        
        switch menu {
        case .fiveCard: dealer.distributeCardToPlayer(to: players, by: 5)
        case .sevenCard: dealer.distributeCardToPlayer(to: players, by: 7)
        }
        
        players.judgePlayersState()
        OutputView.printPlayerCards(with: players, of: players.countPlayers())
        OutputView.printWinner(of: players.judgeWinner())
    }
    
    static func judgeFourCard(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-3 {
            if sortedCard[index].number == sortedCard[index+1].number && sortedCard[index+1].number == sortedCard[index+2].number && sortedCard[index+2].number == sortedCard[index+3].number { return true }
        }
        return false
    }
    
    static func judgeTripple(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-2 {
            if sortedCard[index].number == sortedCard[index+1].number && sortedCard[index+1].number == sortedCard[index+2].number { return true }
        }
        return false
    }
    
    static func judgeTwoPair(of sortedCard: [Card]) -> Bool {
        var pairCount: Int = 0
        for index in 0..<sortedCard.count-1 {
            if sortedCard[index].number == sortedCard[index+1].number { pairCount += 1 }
        }
        if pairCount > 1 { return true }
        return false
    }
    
    static func judgeOnePair(of sortedCard: [Card]) -> Bool {
        for index in 0..<sortedCard.count-1 {
            if sortedCard[index].number == sortedCard[index+1].number { return true }
        }
        return false
    }
    
}
