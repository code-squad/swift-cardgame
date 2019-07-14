//
//  InputView.swift
//  CardGame
//
//  Created by JH on 14/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    //문자열을 입력받는 메소드
    func ask(_ data: String) -> String {
        print("\(data): ", terminator: "")
        return readLine() ?? ""
    }
    
    //숫자만 입력받는 메소드
    func askNumber(_ data: String) -> Int {
        while true {
            let input = ask(data)
            guard let number = Int(input) else {
                print("숫자를 입력해주세요")
                continue
            }
            return number
        }
    }
    
    //옵션들앞에 번호를 붙여 출력하는 메소드
    func showOptions(_ options: [String]) {
        
    }
    
    //제네릭
    func askForChoice<Result>(options: [String: Result]) -> Result {
        
    }
    /*
     [
     "option1": 151,
     "option2": 404
     ]
     
     1. option1
     2. option2
     number: 1
     
     -> 151
     */

    
}
