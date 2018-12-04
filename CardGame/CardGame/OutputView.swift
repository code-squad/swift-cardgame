//
//  OutputView.swift
//  CardGame
//
//  Created by 김장수 on 03/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /*
     입력, 로직, 출력에서 출력에 해당하는 부분을 제거
     */
    
    func printCardStack(by stack: CustomStringConvertible) {
        let cardStack = stack.description.components(separatedBy: " ")
        print(cardStack)
    }
}
