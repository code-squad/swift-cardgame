//
//  InputView.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {
    private struct Guide {
        static let start = "다음 메뉴를 선택해주세요."
        static let menu = MenuItem.allCases
            .map { "\($0.rawValue). \($0.message)" }
            .joined(separator: "\n")
    }

    private static func showGuide() {
        print(Guide.start)
        print(Guide.menu)
    }

    static func readInput() -> String {
        showGuide()
        guard let input: String = readLine() else { return String() }
        return input
    }

}
