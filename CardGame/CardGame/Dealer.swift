//
//  Deeler.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 25..
//  Copyright © 2018년 JK. All rights reserved.
//

struct Dealer: Dealerable {
    
    private var deck: Deck
    private var order: CARDGAME.MENU? = nil
    private var drawCard: Card? = nil
    private var cardStacks: [CardStack] = []
    
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
    
    private mutating func makeStackCard(_ count: Int) -> CardStack {
        var cards: [Card] = []
        for _ in 0 ..< count {
            cards.append(deck.removeOne())
        }
        return CardStack(cards)
    }
    
    mutating func makeFieldCard() {
        for count in 1 ... 7 {
            self.cardStacks.append(makeStackCard(count))
        }
    }
    
    func makeResultFormat() -> String {
        
        guard let order = self.order else {
            return CARDGAME.ERROR.isOrder.description
        }
        
        switch order {
            case .RESET:
                return GAMEMENU.RESET.rawValue
            case .SHUFFLE:
                return "\(GAMEMENU.SHUFFLE.TotalCommand) \(deck.count()) \(GAMEMENU.SHUFFLE.BackCommand)"
            case .DRAW:
                guard let drawCard = self.drawCard else { return CARDGAME.ERROR.unExpected.description}
                return "\(drawCard) \n\(GAMEMENU.DRAW.TotalCommand) \(deck.count()) \(GAMEMENU.DRAW.BackCommand)"
            case .ASK:
                return CARDGAME.ERROR.isOrder.description
        }
    }
    
    func makeResultFormat(_ handler: (CardStack) -> Void) {
        for cards in self.cardStacks {
            handler(cards)
        }
    }
}

