//
//  OutputView.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {

    enum Error: String {
        case notMenu = "메뉴의 내용이 아닙니다. \n"
    }
    
    func errorResult(_ error: Error) {
        print(error.rawValue)
    }
    
    // Overloading
    static func output(_ card: Card) {
        print(card)
    }
    // Overloading
    static func output(_ result: String) {
        print(result)
    }
}

extension OutputView {
    //Game Error
    func errorResult(_ error: GameInputError) {
        print(error.rawValue)
    }
    
    //카드라는 함수를 만들어서 한번에 딜러와, 참가자를 출력하고 싶었다.
    private static func card(dealer: Bool, number: Int, cardStack: String) {
        let name = dealer ? "딜러" : "참가자#\(number+1)"
        print("\(name) \(cardStack)")
    }
    
    private static func card(name: String, cardStack: String) {
        print("\(name) \(cardStack)")
    }
    
    // 결과 출력
    static func showResults(_ cardGame: GameMakePlayers) {
        cardGame.showResult(card(dealer:number:cardStack:))
    }
    
    static func showResults(_ cardGame: CardGame) -> Bool {
        return cardGame.play(card(name:cardStack:),winner)
    }
    
    private static func winner(name: String) {
        print("\n 이번 게임의 승자는 🏆 \(name) 입니다. ")
    }
    
    
}

enum GameInputError: String, Error {
    case notInt = "숫자가 아니다."
    case notMenuGame = "메뉴의 내용이 아니다."
    case noPeople = "1명 이상 게임을 할수 있다."
    case manyPeople = "최대 4명까지 가능하다."
}
