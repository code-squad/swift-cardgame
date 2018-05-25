//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

struct Deeler: RecivedAsk {
    
    private var deck: Deck
    private var oder: Order? = nil
    private var drawCard: Card? = nil
    
    init(_ deck: Deck) {
        self.deck = deck
    }
    
    mutating func receivedOrder(_ order: Order?) throws {
       
        guard let order = order else {
            throw CardGaemError.isOrder
        }
        
        self.oder = order
        
        switch order {
            case .reset:
                deck.reset()
            case .shuffle:
                deck.shuffle()
            case .draw:
                drawCard = deck.removeOne()
        }
    }
    
    func answer() -> String {
        
        switch self.oder {
            case .reset?:
                return CARDGAME_RESET_MSG
            case .shuffle?:
                return "\(CARDGAME_SHUFFLE_TOTAL_COMAND) \(deck.count()) \(CARDGAME_SHUFFLE_BACK_COMAND)"
            case .draw?:
                guard let card = drawCard else { return CARDGAME_UNEXPECTED_ERROR_MSG }
                return "\(card.desription()) \n\(CARDGAME_DRAW_TOTAL_COMAND) \(deck.count()) \(CARDGAME_DRAW_BACK_COMAND)"
            case .none:
                return CARDGAME_UNEXPECTED_ERROR_MSG
        }
    }
}
