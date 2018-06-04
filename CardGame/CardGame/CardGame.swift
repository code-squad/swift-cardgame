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
        self.dealer = Dealer(Deck())
    }
    
    // 참가 선수를 만드는 함수
    func makePlayers(_ player: CARDGAME.PLAYER) {
        for index in 0 ..< player.Count {
            players.append(Player(index + 1))
        }
        players.append(dealer)
    }
    
    // 게임을 시작하는 함수
    func start() {
        makePlayers(numberOfPlayer)
        self.dealer.shuffleCard()
        
        while self.dealer.isClose(rule, numberOfPlayer) {
            distributeCard()
            OutputView.showPlayerCard(players)
            resetCardGame()
        }
    }
    
    // 카드를 한장 씩 나누어 주기 위해 2중 for문 사용
    func distributeCard() {
        for _ in 0 ..< rule.Type {
            for player in players {
                player.receiveCard(dealer.distributeCard())
            }
        }
    }
    
    // player 카드를 버리는 함수
    func resetCardGame() {
        for player in players {
            player.resetMyCard()
        }
    }
}
