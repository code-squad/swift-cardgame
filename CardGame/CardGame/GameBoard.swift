//
//  GameBoard.swift
//  CardGame
//
//  Created by Yoda Codd on 2018. 6. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
/// 카드게임 진행을 하는 보드
struct GameBoard {
    /// 랜덤한 카드 한장을 리턴한다
    func makeRandomCard() -> Card? {
        // 랜덤정수로 카드용 마크,숫자 생성
        let randomMarkNumber = Int(arc4random_uniform(4)+1)
        let randomNumberingNumber = Int(arc4random_uniform(13) + 1)
        
        // 카드 마크 선언
        var randomMark : Mark
        // 랜덤정수를 마크에 입력
        switch randomMarkNumber {
        case 1 : randomMark = Mark.spade
        case 2 : randomMark = .clover
        case 3 : randomMark = .heart
        case 4 : randomMark = .diamond
        default : return nil
        }
        
        // 카드 넘버링 선언
        var randomNumbering : Numbering
        // 랜덤정수를 넘버링에 입력
        switch randomNumberingNumber {
        case 1 : randomNumbering = Numbering.ace
        case 2 : randomNumbering = .two
        case 3 : randomNumbering = .three
        case 4 : randomNumbering = .four
        case 5 : randomNumbering = .five
        case 6 : randomNumbering = .five
        case 7 : randomNumbering = .seven
        case 8 : randomNumbering = .eight
        case 9 : randomNumbering = .nine
        case 10 : randomNumbering = .ten
        case 11 : randomNumbering = .jack
        case 12 : randomNumbering = .queen
        case 13 : randomNumbering = .king
        default : return nil
        }
        
        // 카드 리턴
        return Card(mark: randomMark, numbering: randomNumbering)
    }
}
