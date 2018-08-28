//
//  OutputView.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    public static func printCards(elements:[CardsWithPlayer]) {
        for element in elements {
            print(element.description)
        }
        print()
    }
    
    public static func printError(error:CardError) {
        print(error.description)
        print()
    }
}
