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
        excuteByMenu(by: ChoiceMenu(rawValue: menuInput), to: makePlayers(number: playerInput, dealerPlayer: dealar), with: cardDeck, who: dealar)
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
    
    // 플레이어를 생성
    static private func makePlayers(number: Int, dealerPlayer: Dealer) -> [GameParticipate] {
        var players: [GameParticipate] = []
        for _ in 0..<number { players.append(Player()) }
        players.append(dealerPlayer)
        return players
    }

    // 메뉴에 따라 패를 플레이어에게 나눌 수 있게 구현
    static private func excuteByMenu(by menu: ChoiceMenu?, to players: [GameParticipate], with deck: CardDeck, who dealer: Dealer) {
        guard let menu = menu else { return }
        switch menu {
        case .fiveCard: dealer.distributeCardToPlayer(to: players, by: 5)
        case .sevenCard: dealer.distributeCardToPlayer(to: players, by: 7)
        }
        OutputView.printPlayerCasds(with: players, dealer)
    }
    
    // 게임이 끝난 상태를 확인
    static func isOverGame(_ deck: CardDeck) -> Bool {
        guard deck.count() == 0 else { return false }
        return true
    }
}
