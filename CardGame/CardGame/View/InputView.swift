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
        // 선택지들을 보여줍니다.
        showOptions(options)
        
        while true {
            // 사용자로부터 선택지 숫자를 입력받습니다.
            let choice = askForNumber("선택지")
            // 제공되는 선택지 범위인지 확인합니다.
            guard choice > 0 && choice <= options.count else {
                print("선택지번호를 확인해주세요(1~\(options.count)까지)")
                continue
            }
            // 선택된 문자열을 반환합니다.
            return options[choice - 1]
        }
    }

//    //선택지에 따른 값을 반환하는 메소드
//    func askForChoice<Result>(options: [String: Result]) -> Result {
//        let choice = askForChoice(options: options.map { $0.key }.sorted())
//                    //askForChoice(options: [String].init(options.keys))도 가능함
//        //choice는 값이 확실히 있기때문에 강제추출함
//        return options[choice]!
//    }
}
