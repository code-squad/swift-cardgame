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
        excuteByMenu(by: ChoiceMenu(rawValue: menuInput), to: makePlayers(number: playerInput), with: cardDeck, who: dealar)
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
    static private func makePlayers(number: Int) -> [Player] {
        var players: [Player] = []
        for _ in 0..<number { players.append(Player()) }
        return players
    }

    // 메뉴에 따라 패를 플레이어에게 나눌 수 있게 구현
    static private func excuteByMenu(by menu: ChoiceMenu?, to players: [Player], with deck: CardDeck, who dealer: Dealer) {
        var playersCardStack : [[Card]]
        guard let menu = menu else { return }
        switch menu{
        case .fiveCard: playersCardStack = dealer.makeCardStack(by: 5, with: players.count)
        case .sevenCard: playersCardStack = dealer.makeCardStack(by: 7, with: players.count)
        }
        dealer.distributeCardToPlayer(to: players, what: playersCardStack)
    }
    
    static func isOverGame(_ deck: CardDeck) -> Bool {
        guard deck.count() == 0 else { return false }
        return true
    }
}
