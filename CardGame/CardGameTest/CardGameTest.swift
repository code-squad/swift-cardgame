//
//  CardGameTest.swift
//  CardGameTest
//
//  Created by Yoda Codd on 2018. 6. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class CardGameTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDeck_Reset() {
        var deck = Deck()
        deck.reset()
        XCTAssert(deck.count() == 52)
    }
    func testDeck_RemoveCount() {
        var deck = Deck()
        deck.reset()
        deck.removeOne()
        XCTAssert(deck.count() == 51)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
