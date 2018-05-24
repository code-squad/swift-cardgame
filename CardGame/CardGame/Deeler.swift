//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

struct Deeler {
    
    var deck: Deck
    var desription: String = ""
    
    init(_ deck: Deck) {
        self.deck = deck
    }
    
    mutating func receivedOrder(_ order: Order?) throws {
       
        guard let order = order else {
            throw CardGaemError.isOrder
        }
        
        switch order {
            case .reset:
                self.deck.reset()
                makeAskFormat(order)
            case .shuffle:
                self.deck.shuffle()
                makeAskFormat(order)
            case .draw:
                
                guard deck.count() > 0 else {
                    return
                }
                
                let card = self.deck.removeOne()
                makeAskFormat(order, card)
        }
    }
    
    // 카드가 없는 경우 receviedOrder return이 되어 card를 강제 언래핑 
    private mutating func makeAskFormat(_ order: Order?, _ card: Card? = nil) {
        switch order {
            case .reset?:
                desription = CARDGAME_RESET_MSG
            case .shuffle?:
                desription = "\(CARDGAME_SHUFFLE_TOTAL_COMAND) \(deck.count()) \(CARDGAME_SHUFFLE_BACK_COMAND)"
            case .draw?:
                desription = "\(card!.desription())\n\(CARDGAME_DRAW_TOTAL_COMAND) \(deck.count()) \(CARDGAME_DRAW_BACK_COMAND)"
            case .none:
                desription = "error"
        }
    }
}
