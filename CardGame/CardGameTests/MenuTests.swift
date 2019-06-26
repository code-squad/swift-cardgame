//
//  MenuTests.swift
//  CardGameTests
//
//  Created by 이동영 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MenuTests: XCTestCase {
    
    //Given
    var deck = CardDeck()
    var menu: Menu!
    
    func testReset() {
        //Given
        menu = Reset()
        
        //When
        let (_,notice) = menu.process(cards: self.deck)
        
        //Then
        XCTAssertEqual(notice, "카드 전체를 초기화했습니다.")
    }
    
    func testShuffle() {
        //Given
        menu = Shuffle()
        
        //When
        let (_,notice) = menu.process(cards: self.deck)
        
        //Then
        XCTAssertEqual(notice, "전체 52장의 카드를 섞었습니다.")
    }
  
    func testDraw() {
        //Given
        menu = Draw()
        
        //When
        let (_,notice) = menu.process(cards: self.deck)
        let pattern = "^((♠️|♦️|♥️|♣️)(2|3|4|5|6|7|8|9|10|A|K|J|Q))|(덱이 비었습니다.)$"
        let result = notice.range(of: pattern, options: .regularExpression)
        
        //Then
        XCTAssertNotNil(result)
    }
}
