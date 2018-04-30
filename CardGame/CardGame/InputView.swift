//
//  InputView.swift
//  CardGame
//
//  Created by 김수현 on 2018. 4. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {

    func inputCard() -> String {
        return readLine() ?? ""
    }
    
    func inputPlyer() -> String {
        return readLine() ?? ""
    }
    
    func inputNumber() -> String {
        return readLine() ?? ""
    }
    
}

