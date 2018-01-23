//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() {

    let gameInput = GameInputView()
    let userInputStud = gameInput.askGameType(message:
        OutputView.ProgramDescription.chooseCardStud)
    let stud = gameInput.select(menu: userInputStud)

    guard stud != .quitGame else {
        // 게임 종료
        OutputView().showResult(text:
            OutputView.ProgramDescription.quitGame)
        return
    }
    let inputNumber = gameInput.askNumberOfPlayer(message:
        OutputView.ProgramDescription.askNumberOfPlayer)
    do {
        let controller = try GameController(stud: stud,
                                            numberOfPlayer: inputNumber)
        controller.playWithPause()

    } catch let error as GameController.InitError {
        switch error {
        case .quit: OutputView().showResult(text:error)
            break
        case .wrongMenu: OutputView().showResult(text:error)
        case .wrongPlayerNumber: OutputView().showResult(text:error)
        }
    } catch {
        print("unknown error")
    }
}

run()


