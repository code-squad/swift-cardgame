//
//  TestCardDeck.swift
//  TestCardGame
//
//  Created by RENO1 on 29/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TestCardDeck: XCTestCase {
    var deck:CardDeck = CardDeckImpl()
    
    func test_initCard() {
        deck.initCard()
        let resultCount = deck.getTotalCardCount()
        XCTAssertEqual(52, resultCount)
    }
    
    func test_selectCard_카드가_있는_경우() {
        do {
            let selectedCard = try deck.selectCard()
            XCTAssertNotNil(selectedCard)
        } catch {
            XCTFail()
        }
    }
    
    func test_selectCard_카드가_없는_경우() {
        do {
            let totalCount = deck.getTotalCardCount()
            try deck.remove(count: totalCount)
            try deck.selectCard()
            XCTFail()
        } catch CardError.NO_CARD {
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    
    func test_getTotalCount() {
        let totalCount = deck.getTotalCardCount()
        XCTAssertEqual(totalCount, 52)
    }
    
    func test_remove(){
        do {
            try deck.remove(count: 1)
            let totalCount = deck.getTotalCardCount()
            XCTAssertEqual(totalCount, 51)
        } catch {
            XCTFail()
        }
    }
    
    func test_remove_카드가_있는_경우() {
        do {
            try deck.remove(count: 1)
        } catch {
            XCTFail()
        }
    }
    
    func test_shuffle(){
        deck.shuffle()
    }
}
