//
//  TestCardGame.swift
//  TestCardGame
//
//  Created by Elena on 25/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class TestCardGame: XCTestCase {

    //Card.swift Test code
    //Shape : ♥️ , Number: A
    func testCardDescription_Shape_Heart_Number_Ace() {
        let card = Card(number: .ace, shape: .heart)
        XCTAssertEqual(card.description, "♥️A")
    }
    //Shape : ♥️ , Number: 2
    func testCardDescription_Shape_Heart_Number_Two() {
        let card = Card(number: .two, shape: .heart)
        XCTAssertEqual(card.description, "♥️2")
    }
    //Shape : ♥️ , Number: J
    func testCardDescription_Shape_Heart_Number_Jack() {
        let card = Card(number: .jack, shape: .heart)
        XCTAssertEqual(card.description, "♥️J")
    }
    
    //InputView.swift Test code
    // 메뉴에 영어를 입력 할 경우
    func testGetMenuInputString_Z() {
        let menuDataNilData = "z"
        XCTAssertNil(InputView.getMenu(menuDataNilData))
    }
    // 메뉴에 1 입력 할 경우
    func testGetMenuInputInt_1() {
        let menuDataData = "1"
        XCTAssertEqual(InputView.getMenu(menuDataData),Menu.reset)
    }
    // 메뉴에 2 입력 할 경우
    func testGetMenuInputInt_2() {
        let menuDataData = "2"
        XCTAssertEqual(InputView.getMenu(menuDataData),Menu.shuffle)
    }
    // 메뉴에 3 입력 할 경우
    func testGetMenuInputInt_3() {
        let menuDataData = "3"
        XCTAssertEqual(InputView.getMenu(menuDataData),Menu.pullOut)
    }
    // 메뉴에 4 입력 할 경우
    func testGetMenuInputInt_4() {
        let menuDataData = "4"
        XCTAssertEqual(InputView.getMenu(menuDataData),Menu.quit)
    }
    
    //cardDeck.swift Test code
    // 카드덱 init 이후, 비어있는지 확인
    func testCardDeckInit_isEmpty() {
        let card = CardDeck.init()
        XCTAssertFalse(card.isEmpty)
    }
    // 카드덱 init 이후, 총 52장인지
    func testCardDeckInit_CardCountCheck() {
        let card = CardDeck.init()
        XCTAssertEqual(card.count(), 52)
    }
    // 카드덱 한장 뽑은 이후, 총 51장인지
    func testCardDeckInit_CardCountPullOut() {
        var card = CardDeck.init()
        _ = card.removeOne()
        XCTAssertEqual(card.count(), 51)
    }
    // 카드덱 두장 뽑은 이후, 총 50장인지
    func testCardDeckInit_CardCountPullOut_PullOut() {
        var card = CardDeck.init()
        _ = card.removeOne()
        _ = card.removeOne()
        XCTAssertEqual(card.count(), 50)
    }
    // 카드덱 한장 뽑은 이후, 리셋하면 총 52장인지
    func testInitCardDeckToDefaultStateWel1l() {
        var card = CardDeck.init()
        _ = card.removeOne()
        _ = card.reset()
        XCTAssertEqual(card.count(), 52)
    }

}
