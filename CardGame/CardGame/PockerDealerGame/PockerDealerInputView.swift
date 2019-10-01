//
/******************************************************************************
 * File Name        : GameInputView.swift
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

struct PockerDealerInputView {
    
    public func printMenu() {
       print("카드 게임 종류를 선택하세요.")
       for pdMenu in PockerDealerMenu.allCases where pdMenu.rawValue > 0 {
           print(pdMenu.menuText)
       }
   }

    private func readNumber() -> Int? {
        print("> ", terminator: "")
        let inputedText = readLine()
        let inputedNum = Int(inputedText ?? "")
        
        return inputedNum
    }
    
    public func readMenu() -> PockerDealerMenu? {
        let inputMenu = self.readNumber()
        
        return PockerDealerMenu(rawValue: inputMenu ?? PockerDealerMenu.unknown.rawValue)
    }
    
    public func printPlayerRequirement() {
        print("참여할 사람의 인원을 입력하세요.")
    }
    
    public func readNumOfPlayer() -> Int? {
        return self.readNumber()
    }
}
