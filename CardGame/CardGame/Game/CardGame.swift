//
//  CardGame.swift
//  CardGame
//
//  Created by CHOMINJI on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol OutputViewPrintable {
    func printSettingResult()
    func printWinner()
}

struct CardGame: OutputViewPrintable {
    private let info: GameInfoable
    private var players: PlayersInfo
    private let dealer: Dealerable & Playerable
    
    init(info: GameInfoable, dealer: Dealerable & Playerable) {
        self.info = info
        self.dealer = dealer
        self.players = PlayersInfo(playersNum: info.participants().count, dealer: dealer)
    }
    
    private func canContinueGame() -> Bool {
        let numOfCards = info.gameMode().numOfCards
        let requirement = numOfCards * info.participants().count
        return dealer.hasEnounghCards(for: requirement)
    }
    
    mutating func run() {
        guard canContinueGame() else { return }
        players.setCards(num: info.gameMode().numOfCards)
    }
    
    func printSettingResult() {
        players.showSettingResult(with: OutputView.playerAndCardsForm)
    }
    
    func printWinner() {
        players.showWinner(with: OutputView.winnerForm)
    }
}
