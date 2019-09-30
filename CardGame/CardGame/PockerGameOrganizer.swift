//
//  CommandExecutor.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/29.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol CommandReceiverable {
    func onReceive(command: Command)
}

class PockerGameOrganizer {
    
    private var receiver: CommandReceiverable
    private let dealer: Commandable
    
    init(dealer: Commandable, receiver: CommandReceiverable) {
        self.dealer = dealer
        self.receiver = receiver
    }
    
    func play() {
        while true {
            let command = dealer.next()
            receiver.onReceive(command: command)
            if command == .finish {
                return
            }
            usleep(1000000)
        }
    }
}
