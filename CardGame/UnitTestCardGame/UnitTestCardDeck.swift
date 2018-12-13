//
//  UnitTestCardGame.swift
//  UnitTestCardGame
//
//  Created by 윤동민 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCardDeck: XCTestCase {
    var testCard: CardDeck!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testCard = CardDeck()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testCard = nil
    }
    
    // Count 메소드 테스트
    func testCount() {
        XCTAssertEqual(testCard.count(), 52, "No Equal")
    }
    
    // Shuffle 메소드 테스트
    func testShuffle() {
        guard let beforeShuffle = testCard.removeOne() else { return }
        testCard.shuffle()
        guard let afterShuffle = testCard.removeOne() else { return }
        XCTAssertFalse(isEqualTwoCard(beforeShuffle, afterShuffle))
    }
    
    private func isEqualTwoCard(_ beforeCard: Card, _ afterCard: Card) -> Bool {
        guard beforeCard === afterCard else { return false }
        return true
    }
    
    // IsOverGame 메소드 테스트
    func testIsOverGame() {
        for _ in 0..<52 { testCard.removeOne() }
        XCTAssertEqual(testCard.isOverGame(), true, "not Over Game")
    }
    
    // Reset 메소드 카드 제거 후 리셋 시 52장이 생성됬는지 확인
    func testReset() {
        testCard.removeOne()
        testCard.reset()
        XCTAssertEqual(testCard.count(), 52, "Don't reset CardDeck")
    }
    
    // 카드 덱에 카드가 있을 경우 Nil이 아닌 Card를 반환
    func testRemoveOne() {
        XCTAssertTrue(testCard.removeOne() != nil)
    }
    
    // 카드 덱에 카드가 없을 경우 Nil을 반환
    func testRemoveOneAtNoCard() {
        for _ in 0..<52 { testCard.removeOne() }
        XCTAssertTrue(testCard.removeOne() == nil)
    }
}
