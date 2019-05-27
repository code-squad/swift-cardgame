//
//  CardGame.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGame {
    private var cardDeck = CardDeck()
    private var players = [Player]()
    private var dealer = Dealer()
    
    /// 메뉴 숫자에 따라 함수를 실행시켜준다.
    mutating func executeMenu (_ menu: Menu, _ userCount: UserCount) throws -> ([Player], Dealer) {
        for user in 1...userCount.rawValue {
            let playerName = "참가자#"+String(user)
            let playerCards = try getOneUserCard(menu)
            let player = Player(name: playerName, cards: playerCards)
            
            players.append(player)
        }
        
        dealer = Dealer(cards: try getOneUserCard(menu))
        
        return (players, dealer)
    }
    
    /// 한 유저의 모든 카드 리턴 {
    private mutating func getOneUserCard (_ menu: Menu) throws -> [Card] {
        var oneUserCards = [Card]()
        
        for _ in 0..<menu.userCardCount() {
            oneUserCards.append(try cardDeck.removeOne())
        }
        
        return oneUserCards
    }
    
    /// 게임 종료
    mutating func gameEnd () {
        players.removeAll()
        dealer = Dealer()
    }
}
