//
//  OutputView.swift
//  CardGame
//
//  Created by 윤지영 on 13/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    enum Error: String {
        case notInt = "메뉴는 번호로 입력해주세요."
        case outOfMenu = "위 메뉴 내에서 골라주세요."
    }

    static func notifyError(_ error: Error) {
        print(error.rawValue)
    }

    static func showDescription(of customString: CustomStringConvertible) {
        print(customString)
    }

    static func show(_ result: String) {
        print(result)
    }

}
