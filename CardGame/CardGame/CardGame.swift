//
//  CardGamePresenter.swift
//  CardGame
//
//  Created by RENO1 on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct CardGameImpl: CardGame {
    private let inputView:CardGameView
    private var cardDeck: CardDeck
    
    init(inputView:CardGameView, cardDeck: CardDeck) {
        self.inputView = inputView
        self.cardDeck = cardDeck
    }
    
    mutating func start() {
        while true {
            inputView.showMenu()
            let input:String = readLine() ?? ""
            let inputMenuIndex:Int? = Int(input)
            
            if inputMenuIndex == nil {
                break
            }
            
            if inputMenuIndex! > Menu.allCases.count || inputMenuIndex! < 1 {
                break
            }
            
            switch inputMenuIndex {
            case 1:
                cardDeck.initCard()
                let totalCount = cardDeck.getTotalCardCount()
                inputView.showInitMessage(initCount: totalCount)
                break
            case 2:
                cardDeck.shuffle()
                let totalCount = cardDeck.getTotalCardCount()
                inputView.showShuffleMessage(totalCount: totalCount)
                break
            case 3:
                do {
                    let selectedCard = try cardDeck.selectCard()
                    try cardDeck.remove(count: 1)
                    inputView.showSelectCard(selectCard: selectedCard)
                    let totalCount = cardDeck.getTotalCardCount()
                    inputView.showShuffleMessage(totalCount: totalCount)
                } catch CardError.NO_CARD {
                    inputView.showCardError(error: CardError.NO_CARD)
                } catch {
                    inputView.showCardError(error: CardError.UNKNOWN)
                }
            default:
                break
            }
        }
    }
}

protocol CardGame {
    mutating func start()
}
