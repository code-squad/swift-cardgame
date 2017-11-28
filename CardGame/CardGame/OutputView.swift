//
//  OutputView.swift
//  CardGame
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {

    func showPokerTable(players: Array<CardPack>, dealer: Array<CardPack>) {
        for i in 0..<players.count {
            print("참가자#\(i+1) \(players[i])")
        }
        print("딜러 \(dealer[0])")
    }

}
