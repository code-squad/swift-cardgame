//
//  Game.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Game {
    var players: [MyPlayer]
    let dealer: MyDealer = MyDealer()
    let setting: Setting
    var isContinue: Bool {
        let needs = setting.mode.numOfCard*(self.players.count)
        return self.dealer.canContinue(needs:needs)
    }
    
    init(setting: Setting?) throws {
        guard let setting = setting else {
            throw GameException.initFailure
        }
        self.setting = setting
        self.players = try Game.participate(entry: setting.entry.numOfPlayer)
        self.players.append(dealer)
    }
    
    func start() throws {
        playerReset()
        try drawAll()
        OutputView.show(players: self.players)
    }
    
    private static func participate(entry: Int) throws -> [MyPlayer] {
        var players:[MyPlayer] = []
        var index = 0
        try loop(times: entry) {
            players.append(MyPlayer(name: "참가자#\(++index)"))
        }
        return players
    }
    
    private func drawAll() throws {
        try loop(times: setting.mode.numOfCard) {
            try drawOne()
        }
    }
    
    private func drawOne() throws {
        try self.players.forEach {
            try self.dealer.handsOut(to: $0)
        }
    }
    
    private func playerReset() {
        self.players.forEach{
            $0.clearHand()
        }
    }

}
