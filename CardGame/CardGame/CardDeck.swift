//
//  CardDeck.swift
//  CardGame
//
//  Created by jang gukjin on 18/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

/*
 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현한다.
 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현한다.
 count() 갖고 있는 카드 개수를 반환한다.
 shuffle() 기능은 전체 카드를 랜덤하게 섞는다.
 removeOne() 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
 reset() 처음처럼 모든 카드를 다시 채워넣는다.
 */
import Foundation

struct CardDeck {
    func distinctNumber(of input: String) throws{
        let menuNumber = Int(input)
        switch menuNumber{
        case 1:
        case 2:
        case 3:
        case nil: throw ErrorMessage.notInt
        default: throw ErrorMessage.outOfRange
        }
    }
    func count(){}
    func shuffle(){}
    func removeOne(){}
    func reset(){}
}
