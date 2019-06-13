//
//  InputView.swift
//  CardGame
//
//  Created by hw on 13/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class InputView {
    static func introduce() -> Void {
        print("다음 메뉴를 선택해주세요.")
        print(GameMenu.initialization.description)
        print(GameMenu.shuffle.description)
        print(GameMenu.drawOne.description)
    }
    
    static func readInput() throws -> String{
        guard let input = readLine() else{
            throw GameMenuError.notANumber
        }  
        return input
    }
    
}
