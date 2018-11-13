//
//  CardGameUnitTest.swift
//  CardGameUnitTest
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestMenuController: XCTestCase {

    func testGetMenuReturnNil_whenNotInt() {
        let stringSelected = "a"
        XCTAssertNil(MenuController.getMenu(of: stringSelected))
    }

    func testGetMenuReturnNil_whenMenuIsOutOfRange() {
        let numSelected = "5"
        XCTAssertNil(MenuController.getMenu(of: numSelected))
    }

    func testGetMenuReturnResetItem_whenNum1selected() {
        let numSelected = "1"
        XCTAssertEqual(MenuController.getMenu(of: numSelected), MenuItem.reset)
    }

    func testGetMenuReturnShuffleItem_whenNum1selected() {
        let numSelected = "2"
        XCTAssertEqual(MenuController.getMenu(of: numSelected), MenuItem.shuffle)
    }

    func testGetMenuReturnDrawItem_whenNum1selected() {
        let numSelected = "3"
        XCTAssertEqual(MenuController.getMenu(of: numSelected), MenuItem.draw)
    }

    func testGetMenuReturnQuitItem_whenNum1selected() {
        let numSelected = "4"
        XCTAssertEqual(MenuController.getMenu(of: numSelected), MenuItem.quit)
    }

}
