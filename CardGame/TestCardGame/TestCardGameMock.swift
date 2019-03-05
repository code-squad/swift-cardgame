//
//  TestCardGameMock.swift
//  TestCardGameMock
//
//  Created by Elena on 14/02/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTest: CardGame {
    private var gamePlayersTest: [GamePlayer] = []
    
    // dealer가 필요없어서 새롭게 카드를 생성하는것을 만들게 되었다.
    func addSendRoundPlayer(_ cards: [Card]) {
        let player = Player()
        for card in cards {
            player.take(card: card)
        }
        gamePlayersTest.append(player)
    }
    
    // Winner 인덱스를 확인하려고 반환형을 Int
    /*
     findWinner()까지 직접 구현을 하면 CardGame 객체를 테스트하는게 아니라 뭘 테스트하는거죠?
     - Player() 를 추가해서 카드(highCard,onePair 등) 를 테스트 하려고 만들었습니다.
     
     */
    func findWinner() -> Int? {
        guard var winner = gamePlayersTest.first else { return nil }
        var number = 0
        for index in gamePlayersTest.indices {
            guard let bestWinner = winner.winnerHand else { continue }
            guard let bestPlayer = gamePlayersTest[index].winnerHand else { continue }
            if bestWinner < bestPlayer {
                winner = gamePlayersTest[index]
                number = index
            }
        }
        return number
    }
}


class TestCardGameMock: XCTestCase {
    
    //test : 3명의 사람이 5장의 카드를 가지고 Winner 확인하는 테스트
    func testCardGame_Winner() {
        let highCard = [
            Card.init(number: .queen, shape:.diamond)
            ,Card.init(number: .seven, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .three, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let onePair = [
            Card.init(number: .king, shape:.club)
            ,Card.init(number: .king, shape: .diamond)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .two, shape: .spades)
            ,Card.init(number: .jack, shape: .heart)
        ]
        let fourOfKind = [
            Card.init(number: .nine , shape:.heart)
            ,Card.init(number: .nine, shape: .spades)
            ,Card.init(number: .nine, shape: .club)
            ,Card.init(number: .nine, shape: .diamond)
            ,Card.init(number: .three, shape: .heart)
        ]
        
        let threeCard = [highCard, onePair, fourOfKind]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    
    //test : 모두 highCard 일 경우 Winner 테스트
    func testCardGame_HighCard_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let highCard3 = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .four, shape: .diamond)
            ,Card.init(number: .five, shape: .diamond)
            ,Card.init(number: .queen, shape: .club)
            ,Card.init(number: .king, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, highCard3]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 onePair 일 경우 Winner 테스트
    func testCardGame_onePair_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let onePair = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .ace, shape: .diamond)
            ,Card.init(number: .five, shape: .diamond)
            ,Card.init(number: .queen, shape: .club)
            ,Card.init(number: .king, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, onePair]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 twoPair 일 경우 Winner 테스트
    func testCardGame_twoPair_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let twoPair = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .ace, shape: .diamond)
            ,Card.init(number: .five, shape: .diamond)
            ,Card.init(number: .queen, shape: .club)
            ,Card.init(number: .queen, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, twoPair]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 twoPair 일 경우 Winner 테스트
    func testCardGame_twoPairSame_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let twoPair1 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .two, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .queen, shape: .diamond)
            ,Card.init(number: .queen, shape: .heart)
        ]
        let twoPair2 = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .ace, shape: .diamond)
            ,Card.init(number: .five, shape: .diamond)
            ,Card.init(number: .queen, shape: .club)
            ,Card.init(number: .queen, shape: .spades)
        ]
        
        let threeCard = [highCard1, twoPair1, twoPair2]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 threeOfKind 일 경우 Winner 테스트
    func testCardGame_threeOfKind_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let threeOfKind = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .ace, shape: .diamond)
            ,Card.init(number: .king, shape: .diamond)
            ,Card.init(number: .king, shape: .club)
            ,Card.init(number: .king, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, threeOfKind]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 straight 일 경우 Winner 테스트
    // 1,2,3,4 이게 스트레이트
    func testCardGame_straight_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let straight = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .two, shape: .heart)
            ,Card.init(number: .three, shape: .diamond)
            ,Card.init(number: .four, shape: .club)
            ,Card.init(number: .king, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, straight]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }
    //test : 모두 fourOfKind 일 경우 Winner 테스트
    func testCardGame_fourOfKind_Winner() {
        let highCard1 = [
            Card.init(number: .ace, shape:.diamond)
            ,Card.init(number: .three, shape: .spades)
            ,Card.init(number: .five, shape: .heart)
            ,Card.init(number: .seven, shape: .club)
            ,Card.init(number: .nine, shape: .spades)
        ]
        let highCard2 = [
            Card.init(number: .two, shape:.diamond)
            ,Card.init(number: .four, shape: .spades)
            ,Card.init(number: .six, shape: .heart)
            ,Card.init(number: .eight, shape: .club)
            ,Card.init(number: .ten, shape: .spades)
        ]
        let fourOfKind = [
            Card.init(number: .ace, shape:.spades)
            ,Card.init(number: .king, shape: .heart)
            ,Card.init(number: .king, shape: .diamond)
            ,Card.init(number: .king, shape: .club)
            ,Card.init(number: .king, shape: .spades)
        ]
        
        let threeCard = [highCard1, highCard2, fourOfKind]
        let cardGame = CardGameTest.init(gameMode: .fiveCard, players: 3)
        for index in threeCard {
            cardGame.addSendRoundPlayer(index)
        }
        XCTAssertEqual(cardGame.findWinner(), 2)
    }

}
