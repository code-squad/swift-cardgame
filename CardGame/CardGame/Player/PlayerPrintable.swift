//
//  PlayerPrintable.swift
//  CardGame
//
//  Created by Daheen Lee on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol PlayerPrintable {
    func getNameCardsPairs() -> [(String, Cards)]
}

extension Players: PlayerPrintable {
    func getNameCardsPairs() -> [(String, Cards)] {
        let convertedPlayerNumberPairs = playerNumberPairs.map { (player: Player, number: Int?) -> (String, Cards) in
            let cards = player.cards
            let role = player.role
            guard let participantNumber = number else {
                return ("\(role)", cards)
            }
            return ("\(role)#\(participantNumber)", cards)
        }
        return convertedPlayerNumberPairs
    }
}
