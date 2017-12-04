//
//  InputView.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    private func mainMenu() {
        print("다음 메뉴를 선택해주세요.")
        print("1. 카드 초기화")
        print("2. 카드 섞기")
        print("3. 카드 하나 뽑기")
    }
    
    func read() -> String? {
        mainMenu()
        guard let mainMenuNumber = readLine() else {
            return nil
        }
        return mainMenuNumber
    }
    
}
