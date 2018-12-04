//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck = CardDeck()
    let output = OutputView()
    cardDeck.reset()
    
    // 카드스택을 바로 출력하는 반복문
    for i in 0...6 {
        guard let stud = cardDeck.drawCardStud(of: i) else {
            print(Error.invalidStud)
            return
        }
        let stack = CardStack(stud: stud)
        output.printCardStack(by: stack)
    }
    
    /*
        입력, 로직, 출력에서 로직에 해당하는 부분을 제거
        일시적으로 기능을 제거하는데 입력부터 출력까지 매개변수를 따라가면서 불필요한 부분을 순차적으로 제거
     */
}

main()
