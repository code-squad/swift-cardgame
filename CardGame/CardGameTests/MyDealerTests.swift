//
//  MyPlayerTests.swift
//  CardGameTests
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MyDealerTests: XCTestCase {
    
    //Given
    var dealer = MyDealer()
    var player = MyPlayer()
    
    func testCanContinue() {
        //When
        try! loop(times: 30) {
            _ = try dealer.draw()
        }
        
        //Then
        XCTAssertFalse(dealer.canContinue(needs: 30))
    }
    
    func testDrawSuccess() {
        //When
        try! loop(times: 52) {
            //Then
            XCTAssertNoThrow(try self.dealer.draw())
        }
    }
    
    func testDrawFailure() {
        //When
        try! loop(times: 52) {
            _ = try dealer.draw()
        }
        //Then
        XCTAssertThrowsError(try self.dealer.draw())
        
    }
}

