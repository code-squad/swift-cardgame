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
    while !dealer.deck.isEmpty {
        do {
            guard let participants = try inputView.askForParticipants(), let stud = try inputView.askForStud() else { break }
            try dealer.start(participants, stud)
        }catch let e as InputView.InputError {
            print(e.rawValue)
        }catch let e as Dealer.GameError {
            print(e.rawValue)
        }catch {
            print(error)
        }
        OutputView.printCardStacksWithName(by: dealer)
    }
}

main()
