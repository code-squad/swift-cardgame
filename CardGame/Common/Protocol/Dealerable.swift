//
//  Dealerable.swift
//  CardGame
//
//  Created by Jung seoung Yeo on 2018. 6. 3..
//  Copyright © 2018년 JK. All rights reserved.
//

protocol Dealerable {
    func distributeCard() -> Card
    func shuffleCard()
    func isClose(_ rule: CARDGAME.RURE, _ numberOfPlayer: CARDGAME.PLAYER) -> Bool
}
