//
//  CardStack.swift
//  CardGame
//
//  Created by 김장수 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol StackFormat {
    var description: String? { get }
}

class CardStack: StackFormat {
    private let stud: [Trump]
    
    init(stud: [Trump]) {
        self.stud = stud
    }
    
    var description: String? {
        var result = [String]()
        
        for i in 0..<self.stud.count {
            guard let card = self.stud[i].description else { return nil }
            result.append(card)
        }
        
        return result.description
    }
}
