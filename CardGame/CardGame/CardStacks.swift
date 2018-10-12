//
//  CardStacks.swift
//  CardGame
//
//  Created by 이동건 on 12/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardStacks: GroupProtocol {
    private var cardStacks: [CardStack]
    
    func display(convert: ([String])->()) {
        let stacks = cardStacks.map {"\($0)"}
        return convert(stacks)
    }
    
    init(_ cardStacks: [CardStack]) {
        self.cardStacks = cardStacks
    }
}
