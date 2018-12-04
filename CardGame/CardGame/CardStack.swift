//
//  CardStack.swift
//  CardGame
//
//  Created by 김장수 on 04/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct CardStack: StackFormat {
    private let stud: [Trump]
    
    init(stud: [Trump]) {
        self.stud = stud
    }
    
    func description() -> String {
        var result = String()
        
        for i in 0..<self.stud.count {
            result += (self.stud[i].description() + (i == self.stud.count ? "" : " "))
        }
        
        return result.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
}
