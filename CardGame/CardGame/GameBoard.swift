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
    /// 카드숫자값 을 받아서 문자열로 표시해주는 함수
    private func getNumbering(numbering: Int) -> String? {
        // 입력값을 조건문에 입력
        switch numbering {
        // 각 값에 맞는 알파벳,숫자를 리턴
        case 1 : return "A"
        case 2...10 : return "\(numbering)"
        case 11 : return "J"
        case 12 : return "Q"
        case 13 : return "K"
        // 이외의 경우는 에러처리
        default : return nil
        }
    }
    
    /// 카드모양을 받아서 문자열로 리턴
    private func getMark(mark: Int) -> String? {
        switch mark {
        // 1~4 까지 매치되는 마크 리턴
        case 1 : return "♠️"
        case 2 : return "♣️"
        case 3 : return "♥️"
        case 4 : return "♦️"
        // 이외의 경우는 에러처리
        default : return nil
        }
    }
    
    /// 카드를 받아서 정보를 리턴한다
    func getInformation(card: Card) -> String? {
        // 마크, 넘버링 정보 선언
        guard let mark = getMark(mark: card.mark),let numbering = getNumbering(numbering: card.numbering) else {
            print("카드 정보 추출 실패")
            return nil
        }
        return mark+numbering
    }
    
    /// 랜덤한 카드 한장을 리턴한다
    func makeRandomCard() -> Card? {
        // 랜덤정수로 카드용 마크,숫자 생성
        let randomMark = Int(arc4random_uniform(4)+1)
        let randomNumbering = Int(arc4random_uniform(13) + 1)
        // 랜덤값으로 카드 생성
        guard let card = Card(mark: randomMark, numbering: randomNumbering) else {
            print("카드생성 실패")
            return nil
        }
        // 카드 리턴
        return card
    }
}
