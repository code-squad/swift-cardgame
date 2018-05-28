//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

struct Deeler: DeckStateAsk {
    
    private var deck: Deck
    private var order: CARDGAME.MENU? = nil
    private var drawCard: Card? = nil
    private var fieldCard: [CardStack] = []
    
    init(_ deck: Deck) {
        self.deck = deck
    }
    
    mutating func receivedOrder(_ order: CARDGAME.MENU?) throws {
       
        self.order = order

        guard let order = order else {
            throw CARDGAME.ERROR.isOrder
        }
        
        switch order {
            case .RESET:
                deck.reset()
            case .SHUFFLE:
                deck.shuffle()
            case .DRAW:
                drawCard = deck.removeOne()
            case .ASK:
                throw CARDGAME.ERROR.isOrder
        }
    }
    
    mutating private func cardStackMaker(_ cardCount: Int) -> CardStack {
        var cards: [Card] = []
        for _ in 0 ..< cardCount {
            cards.append(deck.removeOne())
        }
        return CardStack(cards)
    }
    
    mutating func fieldCardMaker() {
        for fieldCardCount in 1 ... 7 {
            self.fieldCard.append(cardStackMaker(fieldCardCount))
        }
    }
    
    func answer() -> String {
        
        guard let order = self.order else {
            return CARDGAME.ERROR.isOrder.desription
        }
        
        switch order {
            case .RESET:
                return GAMEMENU.RESET.rawValue
            case .SHUFFLE:
                return "\(GAMEMENU.SHUFFLE.TotalCommand.desription) \(deck.count()) \(GAMEMENU.SHUFFLE.BackCommand.desription)"
            case .DRAW:
                guard let drawCard = self.drawCard else { return CARDGAME.ERROR.unExpected.desription}
                return "\(drawCard.desription()) \n\(GAMEMENU.DRAW.TotalCommand.desription) \(deck.count()) \(GAMEMENU.DRAW.BackCommand.desription)"
            case .ASK:
                return CARDGAME.ERROR.isOrder.desription
        }
    }
}

extension Deeler: CardStackStateAsk {
    
    func fieldCardAsk(_ fieldAsk: (CardStack) -> Void) {
        for cards in fieldCard {
            fieldAsk(cards)
        }
    }
}
