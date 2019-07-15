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
    func askForNumber(_ data: String) -> Int {
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
        for (index, option) in options.enumerated() {
            print("\(index+1). \(option)")
        }
    }
    
    //askForNumber에서 선택한 string반환
    func askForChoice(options: [String]) -> String {
        showOptions(options)
        while  true {
            let choice = askForNumber("선택지")
            guard choice > 0 && choice <= options.count else {
                print("선택지번호를 확인해주세요(1~\(options.count)까지)")
                continue
            }
            let index = choice - 1
            return options[index]
        }
    }
//
//    //제네릭
//    func askForChoice<Result>(_ data: String, options: [String: Result]) -> Result {
//
//    }
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
