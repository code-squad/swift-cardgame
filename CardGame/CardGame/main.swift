//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    var game = StudPokerGame(.sevenCard, with: 1)
    let inputView = InputView()

    // 카드가 다 떨어질 때까지 진행.
    repeat {
        do {
            guard let numberOfPeople = try inputView.askForParticipants(), let stud = try inputView.askForStud() else { break }
            game = StudPokerGame(stud, with: numberOfPeople)
            try game.begin()
            // 덱에 카드가 모자른 경우, 에러만 찍고 끝내기 위해 do문 안에 작성. (do문 밖에 작성 시, 에러 출력 후 이전 카드스택을 출력하기 때문)
            OutputView.printCardStacks(of: game)
//            OutputView.printCardStacksWithName(of: game)
        }catch let e as InputView.InputError {
            print(e.rawValue)
        }catch let e as StudPokerGame.GameError {
            print(e.rawValue)
        }catch {
            print(error)
        }
    }while(!game.isDeckEmpty)

}

main()
