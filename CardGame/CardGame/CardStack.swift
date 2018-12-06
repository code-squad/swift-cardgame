//
//  CardStack.swift
//  CardGame
//
//  Created by 김장수 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CardStack: CustomStringConvertible {
    private var stud: [Trump]
    
    init(stud: [Trump]) {
        self.stud = stud
    }
    
    var description: String {
        return self.stud.description
    }
    
    func take(_ stud: [Trump]) {
        self.stud = stud
    }
}
