//
//  InputView.swift
//  CardGame
//
//  Created by temphee.Reid on 30/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


struct InputView {
    static func readChoice(inputReadable: InputReadable, message: Menu) -> String {
        return inputReadable.read(message: message)
    }
}
