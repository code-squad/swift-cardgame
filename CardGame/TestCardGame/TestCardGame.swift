//
//  TestCardGame.swift
//  TestCardGame
//
//  Created by RENO1 on 25/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TestCardGame: XCTestCase {
    // 1 -> ♠︎
    // 2 -> ♣︎
    // 3 -> ♥︎
    // 4 -> ♦︎
    func test_printCardInfo_스페이드2() {
        let expectedShape = Shape.Spades
        let expectedNumber = "2"
        
        let inputCard = Card(shape: expectedShape, cardNumber: expectedNumber)
        
        XCTAssertEqual("\(expectedShape.rawValue)\(expectedNumber)" , inputCard.description)
    }

    

}
