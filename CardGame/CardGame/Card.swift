//
//  Card.swift
//  CardGame
//
//  Created by oingbong on 2018. 8. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/*
 카드를 class로 선택한 이유는 카드의 개수는 number * shape 로 총 52개가 정해져있는데 값타입보다는 참조타입이 적합하다고 판단되어 사용하였습니다.
 의도에 맞게 class를 사용하였는지 잘 모르겠으나 추후 코드수정을 조금이나마 줄이기 위해 구조체 대신 선택하였습니다.
 */

class Card {
    var number : UnicodeScalar?
    var shape : UnicodeScalar?
    
    init() {
        self.number = self.pick(CardNumberEnum.allCases)
        self.shape = self.pick(CardShapeEnum.allCases)
    }
    
    // 카드 선택하는 함수
    func getCard() -> String? {
        guard let shape = self.shape , let number = self.number else { return nil }
        return "\(shape.description)\(number.description)"
    }
    
    // 선택하는 함수
    func pick(_ cardProtocols:[CardProperty]) -> UnicodeScalar? {
        let cardProtocol = self.random(cardProtocols)
        let UnicodeNumber = self.convertUnicode(cardProtocol)
        return UnicodeNumber
    }
    
    // 랜덤으로 골라주는 함수
    func random(_ cardProtocol: [CardProperty]) -> CardProperty {
        let index = Int(arc4random_uniform(UInt32(cardProtocol.count)))
        let element = cardProtocol[index]
        return element
    }
    
    // 문자열 -> 유니코드 변경하는 함수
    func convertUnicode(_ cardProtocol: CardProperty) -> UnicodeScalar? {
        let element = cardProtocol.description
        let unicodeScalar = element.unicodeScalars.first
        guard let unicodeNumber = unicodeScalar?.value else { return nil }
        return UnicodeScalar(unicodeNumber)
    }
}
