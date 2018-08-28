//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printCards(elements:CardsWithPlayer) {
        print(elements.description)
        print()
    }
    
    static func printError(error:CardError) {
        print(error.description)
        print()
    }
}
