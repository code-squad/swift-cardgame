//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 심 승민. All rights reserved.
//

import Foundation

func main() {
    var dealer = Dealer()
    let inputView = InputView()
    while !dealer.isDeckEmpty {
        do {
            guard let participants = try inputView.askForParticipants(), let stud = try inputView.askForStud() else { break }
            try dealer.start(participants, stud)
            // 덱에 카드가 모자른 경우, 에러만 찍고 끝내기 위해 do문 안에 작성. (do문 밖에 작성 시, 에러 출력 후 이전 카드스택을 출력하기 때문)
            OutputView.printCardStacksWithName(by: dealer)
        }catch let e as InputView.InputError {
            print(e.rawValue)
        }catch let e as Dealer.GameError {
            print(e.rawValue)
        }catch {
            print(error)
        }
    }
}

main()
