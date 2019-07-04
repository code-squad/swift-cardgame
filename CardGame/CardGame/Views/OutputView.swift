//
//  GameOutputView.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func outputGame (_ input:String, _ input2: String) -> Void { output("\(input) - \(input2)") }
    
    static func outputWinner (_ input: String) -> Void {
        output("이번 게임의 승자는 \(input) 입니다.")
    }
    
    static func output<T>(_ input: T) -> Void {
        print(input)
    }
 
}
