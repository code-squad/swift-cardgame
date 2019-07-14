//
//  InputView.swift
//  CardGame
//
//  Created by JH on 14/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {

    func ask(_ data: String) -> String {
        print("\(data): ", terminator: "")
        return readLine() ?? ""
    }
    
    
}
