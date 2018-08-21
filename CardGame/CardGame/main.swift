//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    static func run(){
        guard let symbol = Symbol(rawValue: Symbol.generator) else { return }
        guard let number = Number(rawValue: Number.generator) else { return }
        
        let card = Card(symbol: symbol, number: number)
        OutputView.display(card)
    }
}

Main.run()
