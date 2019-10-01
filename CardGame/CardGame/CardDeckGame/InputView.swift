//
/******************************************************************************
 * File Name        : InputView.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

struct InputView {
    
    public func printMenu() {
        print("다음 메뉴를 선택해주세요.")
        for deckMenu in DeckMenu.allCases where deckMenu.rawValue > 0 {
            print(deckMenu.menuText)
        }
    }
    
    public func readUserInput() -> DeckMenu? {
        print("> ", terminator: "")
        let inputedText = readLine()
        let inputMenu = Int(inputedText ?? "")
        
        return DeckMenu(rawValue: inputMenu ?? DeckMenu.unknown.rawValue)
    }
    
}
