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
    private let commander: Commandable
    
    init(commander: Commandable, receiver: CommandReceiverable) {
        self.commander = commander
        self.receiver = receiver
    }
    
    func play() {
        guard let command = commander.next() else {
            return
        }
        receiver.onReceive(command: command)
    }
}
