//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printCard(action:String, count:Int, countAction:String) {
        print(action)
        print("총 \(count)\(countAction)")
        print()
    }
    
    static func printCards(cards:[Card]) {
        print(cards)
    }
    
    static func printError(error:CardError) {
        print(error.rawValue)
        print()
    }
}
