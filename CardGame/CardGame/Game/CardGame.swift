//
//  CardGame.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
//GameMode : 1번을 누르면 7장 카드 , 2번을 누르면 5장의 카드를 출력하기 위해
enum GameMode: Int, CaseIterable {
    case sevenCard = 1 , fiveCard
    
    var modeCardNumber: Int {
        switch self {
        case .sevenCard:
            return 7
        case .fiveCard:
            return 5
        }
    }
}

protocol GamePlayer {
    func take(card: Card)
    func showCards() -> String
    func resetCards()
}

class CardGame {
    private let gameMode: GameMode
    let gameMakePlays: GameMakePlayers
    
    //초기화
    init(gameMode: GameMode, players: Int){
        self.gameMode = gameMode
        let make = GameMakePlayers.init(players: players)
        self.gameMakePlays = make
    }
    
    private func reset() {
        for player in gameMakePlays.gamePlayers {
            player.resetCards()
        }
    }
    
    func play() -> Bool {
        reset()
        guard gameMakePlays.sendRound(gameMode.modeCardNumber) else { return false }
        return true
    }

}

/*
 //
 //  CardGame.swift
 //  CardGame
 //
 //  Created by Elena on 30/01/2019.
 //  Copyright © 2019 JK. All rights reserved.
 //
 
 import Foundation
 //GameMode : 1번을 누르면 7장 카드 , 2번을 누르면 5장의 카드를 출력하기 위해
 enum GameMode: Int, CaseIterable {
 case sevenCard = 1 , fiveCard
 
 var modeCardNumber: Int {
 switch self {
 case .sevenCard:
 return 7
 case .fiveCard:
 return 5
 }
 }
 }
 
 protocol GamePlayer {
 func take(card: Card)
 func showCards() -> String
 func resetCards()
 }
 
 class CardGame {
 private let gameMode: GameMode
 private var dealer: Dealer
 private var gamePlayers: [GamePlayer] = []
 
 //초기화
 init(gameMode: GameMode, players: Int) throws {
 self.gameMode = gameMode
 self.dealer = Dealer(CardDeck())
 setPlayers(add: players)
 }
 // 입력받은 참가자와, 딜러를 추가하기 위한 함수
 private func setPlayers(add players: Int) {
 for _ in 0..<players {
 let player = Player()
 gamePlayers.append(player)
 }
 gamePlayers.append(dealer)
 }
 
 private func reset() {
 for player in gamePlayers {
 player.resetCards()
 }
 }
 // 모드에 따라 참여한 사람에게 모드 수만큼의 카드를 나누어준다.
 private func sendRound() -> Bool {
 for _ in 0..<gameMode.modeCardNumber {
 for player in gamePlayers {
 guard let card = dealer.removeDeal() else { return false }
 player.take(card: card)
 }
 }
 return true
 }
 
 func play() -> Bool {
 reset()
 guard sendRound() else { return false }
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

 */
