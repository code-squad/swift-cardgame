//
//  UnitTestValidChecker.swift
//  UnitTestCardGame
//
//  Created by 조재흥 on 18. 12. 9..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest
@testable import CardGame

class UnitTestValidChecker: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckNumberOfParticipant() {
        XCTAssertTrue(ValidChecker.check(numberOfParticipant: 4))
        XCTAssertFalse(ValidChecker.check(numberOfParticipant: 5))
    }

    func testCheckGameType() {
        XCTAssertTrue(ValidChecker.check(gameType: 5))
        XCTAssertFalse(ValidChecker.check(gameType: 6))
    }
    
    func testCheckContinuable() {
        XCTAssertTrue(ValidChecker.checkContinuable(gameType: 5, numberOfParticipant: 3, numberOfCards: 20))
        XCTAssertFalse(ValidChecker.checkContinuable(gameType: 5, numberOfParticipant: 3, numberOfCards: 19))
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
