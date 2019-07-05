//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

do {
    let mode = try GameInputView.getMode()
    let entry = try GameInputView.getEntry()
    let setting = Setting.init(mode: mode, entry: entry)
    let game = try Game.init(setting: setting)

    repeat {
       try game.start()
    } while game.isContinue
}
catch {
    OutputView.output(error.localizedDescription)
}

