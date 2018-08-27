//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

/*
 일시적으로 기능을 제거할 때 어떤 방법이 좋은지 고민
 : 객체단위로 코드를 구현되있기 때문에 아래와 같이 간단하게 처리하였습니다.
 1. 입력받는 것으로 시작하는 메소드 호출을 주석처리
 2. 카드생성 & 카드섞기 메소드 호출
 3. 카드출력
 */

enum GameType : String {
    case seven = "1"
    case five = "2"
    
    var number: Int {
        switch self {
        case .seven:
            return 7
        case .five:
            return 5
        }
    }
}

enum NumberOfPlayers : String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    
    var number: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        }
    }
}

struct Player {
    var cards = [Card]()
}

struct Players {
    var player = [Player]()
}

struct Dealer {
    var cards = [Card]()
}

struct CardsWithPerson {
    var players : String
    var cards : [Card]
}

struct Game {
    var gameType : GameType
    var player : NumberOfPlayers
    
    func shareCard() {
        CardDeck.reset()
        CardDeck.shuffle()
        
        // Players
        for i in 0..<self.player.number {
            if let cards = CardDeck.remove(self.gameType.number) {
                let player = Player.init(cards: cards)
                let cardsWithPerson = CardsWithPerson.init(players: "참가자#\(i + 1)", cards: player.cards)
                OutputView.printCards(elements: cardsWithPerson)
            }
        }
        
        // Dealer
        if let cards = CardDeck.remove(self.gameType.number) {
            let cardsWithPerson = CardsWithPerson.init(players: "딜러", cards: cards)
            OutputView.printCards(elements: cardsWithPerson)
            
        }
        
    }
}

struct CardGame {
    public static func play() {
        while true {
            do {
                // GameType
                let inputGameType = InputView.readGameType()
                guard let gameType = InputView.isEmpty(to: inputGameType) else { throw CardError.inputNil }
                guard let pickGameType = GameType.init(rawValue: gameType) else { throw CardError.unknown }
                
                // NumberOfPlayers
                let inputPlayer = InputView.readPlayer()
                guard let number = InputView.isEmpty(to: inputPlayer) else { throw CardError.inputNil }
                guard let numberOfplayers = NumberOfPlayers.init(rawValue: number) else { throw CardError.unknown }

                // Game
                let game = Game.init(gameType: pickGameType, player: numberOfplayers)
                game.shareCard()
            } catch let cardError as CardError {
                OutputView.printError(error: cardError)
            } catch {
                OutputView.printError(error: CardError.unknown)
            }
        }
    }
}

CardGame.play()
