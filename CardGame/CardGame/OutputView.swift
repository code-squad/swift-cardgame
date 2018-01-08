//
//  OutputView.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 22..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class OutputView {
    
    private let cardDeck: CardDeck
    private let gameInfo: GameInfo
    
    init(cardDeck: CardDeck, gameInfo: GameInfo) {
        self.cardDeck = cardDeck
        self.gameInfo = gameInfo
    }
    
    func printResult(numberOfMenu: Int) {
        switch numberOfMenu {
        case 1:
            cardDeck.reset()
            print("카드 전체를 초기화했습니다.")
            print("총 \(cardDeck.count())장의 카드가 있습니다.")
        case 2:
            cardDeck.shuffle()
            print("전체 \(cardDeck.count())장의 카드를 섞었습니다.")
        case 3:
            let card = cardDeck.removeOne()
            print(card.shape, card.number)
            print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
        default:
            break
        }
    }
    
    func printCardStack() {
        let cardStack = cardDeck.makeCardStack()
        for player in cardStack {
            for card in player {
                print(card)
            }
        }
    }
    
    func printPokerDealer() -> Bool {
        var cardStack: [[Card]]
        do {
            cardStack = try cardDeck.makeCardStack(gameInfo: gameInfo)
        }catch {
            print("게임종료.")
            return false
        }
        for (index, _) in cardStack.enumerated() {
            print("참가자#\(index)", terminator: "\t\t")
        }
        print("딜러 ")
        
        for (index, _) in cardStack[0].enumerated() {
            for player in 0..<cardStack.count {
                print(cardStack[player][index].description, terminator: "\t\t\t")
//                sleep(1)
            }
            print()
        }
        printWinner(stack: cardStack)
        return true
    }
    
    func printWinner(stack: [[Card]]) {
        let pokerPoint = PokerPoint()
        var pointOfWinner = 0
        var winnerPlayer = 0
        var counting = 0
        for cardsOfPlayer in stack {
            let pointOfResult = pokerPoint.calculatePokerPoint(cards: cardsOfPlayer)
            if pointOfResult > pointOfWinner {
                pointOfWinner = pointOfResult
                winnerPlayer = counting
            }
            counting += 1
        }
        print()
        print("참가자#\(winnerPlayer+1) 승리!!!!")
    }
    
}

