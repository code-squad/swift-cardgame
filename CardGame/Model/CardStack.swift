//
//  CardStack.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

class CardStack {
    private var fieldCard: [Card]
    
    init(_ cards: [Card]) {
        self.fieldCard = cards
    }
    
}

extension CardStack: CustomStringConvertible {
    var description: String {
        return fieldCard.description
    }
}
