//
//  OutputView.swift
//  CardGame
//
//  Created by junwoo on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func getResult(inquiry: Inquiry, deck: CardDeck) -> CardDeck {
        return Answer.action(inquiry: inquiry, cardDeck: deck)
    }
}
