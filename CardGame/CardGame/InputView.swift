//
//  InputView.swift
//  CardGame
//
//  Created by BLU on 28/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static private func readData() -> String {
        for item in GameMenu.allCases {
            print("\(item.index). \(item.description)")
        }
        return readLine() ?? ""
    }
    
    static func readMenuNumber() -> Int {
        let menuNumber = readData()
        return Int(menuNumber) ?? 0
    }
}
