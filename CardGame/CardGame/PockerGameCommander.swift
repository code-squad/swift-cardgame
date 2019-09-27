//
//  PockerGameCommander.swift
//  CardGame
//
//  Created by sungchan.you on 2019/09/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Command: Int {
    case reset = 1, shuffle, distribute
}

protocol Commandable {
    func next() -> Command?
}

struct PockerGameCommander: Commandable {
    private let reader: InputReadable
    
    init(reader: InputReadable) {
        self.reader = reader
    }
    
    func next() -> Command? {
        guard let number = Int(reader.read()) else {
            return nil
        }
        return Command(rawValue: number)
    }
}
