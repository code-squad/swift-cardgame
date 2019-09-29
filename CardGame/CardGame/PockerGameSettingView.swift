//
//  GameConfiguration.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum PockerGameType: Int {
    case fiveCards  = 5
    case sevenCards = 7
}

struct PockerGameSettingView {
    
    let reader: UserInputReadable
    
    init(reader: UserInputReadable) {
        self.reader = reader
    }
    
    func readNumberOfPlayers() -> Int {
        guard let num = Int(reader.read(prompt: .readNumberOfPlayer)), num < PockerGameRule.maxNumberOfPlayers, num > 0 else {
            return PockerGameRule.defaultNumberOfPlayers
        }
        return num
    }
    
    func readGameType() -> PockerGameType {
        var type: PockerGameType
        switch Int(reader.read(prompt: .readGameType)) {
        case 1  : type = PockerGameType.sevenCards
        case 2  : type = PockerGameType.fiveCards
        default : type = PockerGameRule.defaultPockerGameType
        }
        return type
    }
}
