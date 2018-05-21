//
//  Deck+.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 5. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

extension Deck: Equatable {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        var lhsTmp = lhs
        var rhsTmp = rhs
    
        for _ in 0 ..< lhs.count() {
            if lhsTmp.removeOne().desription() != rhsTmp.removeOne().desription() {
                return false
            }
        }
        
        return true
    }
}
