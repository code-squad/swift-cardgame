//
//  CardGame.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 6. 4..
//  Copyright © 2018년 JK. All rights reserved.
//

class CardGame {
    
    private var players: [Playerable] = [Playerable]()
    private var dealer: Dealer
    private var numberOfPlayer: CARDGAME.PLAYER
    private var rule: CARDGAME.RURE
    
    init(_ rule: CARDGAME.RURE, _ numberOfPlayer: CARDGAME.PLAYER) {
        self.rule = rule
        self.numberOfPlayer = numberOfPlayer
        self.dealer = Dealer()
    }
    
    // 참가 선수를 만드는 함수
    private func makePlayers(_ player: CARDGAME.PLAYER) {
        for index in 0 ..< player.Count {
            players.append(Player(index + 1))
        }
        players.append(dealer)
    }
    
    // 게임을 시작하는 함수
    func start() {
        makePlayers(numberOfPlayer)
        self.dealer.shuffleCard()
        
        while isClose() {
            distributeCard()
            OutputView.showPlayerCard(players)
            resetCardGame()
        }
    }
    
    private func isClose() -> Bool {
        return self.dealer.deck.count() >= (rule.Type * (numberOfPlayer.Count + 1)) ? true : false
    }
    
    // 카드를 한장 씩 나누어 주기 위해 2중 for문 사용
    private func distributeCard() {
        for _ in 0 ..< rule.Type {
            for player in players {
                player.receiveCard(dealer.distributeCard())
            }
        }
    }
    
    // player 카드를 버리는 함수
    private func resetCardGame() {
        for player in players {
            player.resetMyCard()
        }
    }
}
