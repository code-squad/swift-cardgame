//
//  GameOutputView.swift
//  CardGame
//
//  Created by 이동영 on 29/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func output<P: Printable>(printable: P) {
        output(printable.printOut)
    }
    
    static func output<T> (_ target: T) {
        print(target)
    }
}
