//
//  UnitTestCardGame.swift
//  UnitTestCardGame
//
//  Created by 조재흥 on 18. 12. 9..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest
@testable import CardGame

class UnitTestCardGame: XCTestCase {

    let dealer = Dealer()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfDeck() {
        XCTAssertEqual(dealer.numberOfDeck(), 52)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
