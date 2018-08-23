//
//  CardDeckGenerator.swift
//  CardGame
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardDeckGenerator {
    static func generateCards() throws -> [Card] {
        var cards: [Card] = []
        
        for indexOfSymbol in (1...Symbol.availables) {
            for indexOfNumber in (1...Number.availables) {
                do {
                    let card = try generateCard(symbol: indexOfSymbol, number: indexOfNumber)
                    cards.append(card)
                }catch let err {
                    throw err
                }
            }
        }
        
        return cards
    }
    
    static private func generateCard(symbol: Int, number: Int) throws -> Card {
        guard let symbol = Symbol(rawValue: symbol) else {
            throw CardGameError.invalidSymbol
        }
        guard let number = Number(rawValue: number) else {
            throw CardGameError.invalidNumber
        }
        
        return Card(symbol: symbol, number: number)
    }
}
