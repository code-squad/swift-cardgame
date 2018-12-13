//
//  UnitTestDealer.swift
//  UnitTestCardGame
//
//  Created by 윤동민 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestDealer: XCTestCase {
    var dealer: Dealer!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var deck: CardDeck = CardDeck()
        dealer = Dealer(of: deck)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dealer = nil
    }
    
    func testDistributeCardToPlayer() {
        
    }

}
