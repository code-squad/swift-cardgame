//
//  GameOutputView.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static let outputGame: (String) -> Void = { output($0) }
    static let outputWinner: (String) -> Void = {
        output("이번 게임의 승자는 \($0) 입니다.")
    }
    
    static func output<T> (_ input:T) -> Void {
        print(input)
    }
    
}
