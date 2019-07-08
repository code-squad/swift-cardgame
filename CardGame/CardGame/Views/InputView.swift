//
//  InputView.swift
//  CardGame
//
//  Created by 이진영 on 27/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(ment: String) -> String {
        print(ment)

        return readLine() ?? ""
    }
}
