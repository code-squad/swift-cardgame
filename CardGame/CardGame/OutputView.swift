//
//  OutputView.swift
//  CardGame
//
//  Created by moon on 2018. 5. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol CardStackPrintable {
    func descriptionOfCardStack(at index: Int) -> String
}

struct OutputView {
    
    static func printCardStack(_ allCardStack: CardStackPrintable, numberOfCardStack: Int) {
        for indexOfCardStack in 0..<numberOfCardStack {
            print(allCardStack.descriptionOfCardStack(at: indexOfCardStack))
        }
    }
}
