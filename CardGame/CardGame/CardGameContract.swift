//
//  CardGameContract.swift
//  CardGame
//
//  Created by RENO1 on 27/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol CardGameView {
    func showMenu()
    func showTotalCardCount(totalCount:Int)
    func showInitMessage()
    func showShuffleMessage(totalCount:Int)
    func showSelectCard(selectCard:Card)
}

protocol CardGamePresenter {
    func initCard()
    func remove(removeCount:Int)
    func shuffle()
    func reset()
    func getTotalCountOfCard() -> Int
    func selectCard(count:Int) -> Card
}

