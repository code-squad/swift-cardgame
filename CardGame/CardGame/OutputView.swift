//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printAction(message: Message) {
        print(message.condition)
        print("총 \(message.count)\(message.action)")
        print()
    }
    
    static func printCards(cards:[Card]) {
        print(cards)
    }
    
    static func printError(error:CardError) {
        print(error.description)
        print()
    }
}
