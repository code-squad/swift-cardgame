//
//  OutputView.swift
//  CardGame
//
//  Created by temphee.Reid on 30/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


struct OutputView {
    static func showPlayerCards(players: [PokerPlayable]) {
        for player in players {
            self.showPlayerCards(player: player)
        }
    }
    
    static func showPlayerCards(player: PokerPlayable) {
        print("\(player.name!)\t[\(player.myOwnCard())]")
    }
    
    static func showMessage(message: String) {
        print("\(message)")
    }
    
    static func showError(error: CardGameError) {
        print(error)
    }
    
    static func showWinnder(winner: PokerPlayable) throws {
        print("\n이번 게임의 승자는 \(winner.name!) 입니다 [\(try winner.hands())]")
    }
    
    static func showResult(choosenMenu:Int, cardDeck: CardDeck) throws {
        switch choosenMenu {
        case 1:
            cardDeck.reset()
            print("카드 전체를 초기화 했습니다")
            //print(cardDeck)
            print("총 \(cardDeck.count()) 장의 카드가 있습니다")
            
        case 2:
            //print(cardDeck)
            cardDeck.shuffle()
            print("전체 \(cardDeck.count()) 장의 카드를 섞었습니다")
        //print(cardDeck)
        case 3:
            let card = cardDeck.removeOne()
            print(card)
            print("총 \(cardDeck.count()) 장의 카드가 남았습니다.")
            //print(cardDeck)
            
        default :
            throw CardGameError.invalidMenuNumber
        }
        
        print("")
    }
    
    
}
