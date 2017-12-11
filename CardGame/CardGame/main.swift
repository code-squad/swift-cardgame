//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    let inputView = InputView()
    var game = StudPokerGame(.sevenCard, with: 1)
    var outputView = OutputView(game)

    // 같은 멤버, 스터드의 게임에서 이기는 사람이 나올 때까지 한 게임 진행. (덱의 카드가 떨어지면 전체 게임 종료.)
    inputLoop: while true {
        do {
            guard let numberOfPeople = try inputView.askForParticipants(), let stud = try inputView.askForStud() else { return }
            game = StudPokerGame(stud, with: numberOfPeople)
            break
        }catch let e as InputView.Error {
            print(e.rawValue)
            continue inputLoop
        }catch {
            print(error)
            return
        }
    }

    outputView = OutputView(game)

    // 카드가 다 떨어질 때까지 같은 멤버로 진행.
    while !game.isLackOfCards() {
        // 이기는 사람이 나오면 다시 카드 분배.
        guard let _ = try? game.begin() else { break }
        // 덱에 카드가 모자른 경우, 에러만 찍고 끝내기 위해 do문 안에 작성. (do문 밖에 작성 시, 에러 출력 후 이전 카드스택을 출력하기 때문)
        outputView.printCardStacksWithName()
        // 승자 출력.
        outputView.printWinner(game.chooseWinner())
        if inputView.tryAgain() { continue }
        else { break }
    }

}

main()
