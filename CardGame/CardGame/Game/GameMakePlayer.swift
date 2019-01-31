//
//  GameMakePlayers.swift
//  CardGame
//
//  Created by Elena on 31/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct GameMakePlayers {
    
    var gamePlayers: [GamePlayer] = []
    private var dealer: Dealer
    
    init(players: Int) {
        self.dealer = Dealer(CardDeck())
        setPlayers(add: players)
    }
    
    // 입력받은 참가자와, 딜러를 추가하기 위한 함수
    mutating func setPlayers(add players: Int) {
        for _ in 0..<players {
            let player = Player()
            gamePlayers.append(player)
        }
        gamePlayers.append(dealer)
    }
    
    // 모드에 따라 참여한 사람에게 모드 수만큼의 카드를 나누어준다.
    func sendRound(_ mode: Int) -> Bool {
        for _ in 0..<mode {
            for player in gamePlayers {
                guard let card = dealer.removeDeal() else { return false }
                player.take(card: card)
            }
        }
        return true
    }

    //isDealer? ,number,cards 내용을 결과돌려줌
    func showResult(_ result: (Bool, Int, String) -> Void) {
        for index in gamePlayers.indices {
            let isDealer = gamePlayers[index] is Dealer
            let number = index
            let cards = gamePlayers[index].showCards()
            result(isDealer, number, cards)
        }
    }
}
