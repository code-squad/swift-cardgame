//
//  Players.swift
//  CardGame
//
//  Created by 이동영 on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PlayerEntry: Entry {
    typealias P = MyPlayer
    
    var count: Int { return players.count }
    private var players: [MyPlayer]
    private var dealer: MyDealer
   
    init(num: Int, dealer: MyDealer) {
        self.players = Array(1...num).map { MyPlayer(name: "참가자#\($0)") }
        self.players.append(dealer)
        self.dealer = dealer
    }
    
    func win() -> P {
        let winner = self.players.reduce(players[0]) { $0 < $1 ? $1 : $0 }
        return winner
    }
    
    func reset() {
        self.players.forEach{ $0.clearHand() }
    }
    
    func draw(numOfCard: Int, completion: () -> (Void)) throws {
        try Array(1...numOfCard).forEach { _ in try drawOne(); completion() }
    }
    
    private func drawOne() throws {
        try self.players.forEach { $0.receive(try dealer.draw()) }
    }
    
}
extension PlayerEntry: MultiValuesPrintable {
    
    func print(logic: @escaping (String, String) -> Void ) {
        self.players.forEach{ $0.print(logic: logic ) }
    }
    
}
