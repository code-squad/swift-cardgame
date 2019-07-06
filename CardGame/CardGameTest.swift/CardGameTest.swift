//
//  CardGameTest_swift.swift
//  CardGameTest.swift
//
//  Created by JieunKim on 03/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {

    override func setUp() {
        var deck = CardDeck()
        
        func testCount() {
            XCTAssertEqual(deck.count(), 52)
        }
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
