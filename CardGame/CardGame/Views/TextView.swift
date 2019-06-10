//
//  TextView.swift
//  CardGame
//
//  Created by 김성현 on 10/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TextView {
    
    static func show(_ text: String) {
        print(text)
    }
    
    static func nextLine() {
        print()
    }
    
    static func show(card: Card) {
        print("[\(card)]")
    }
}
