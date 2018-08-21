//
//  Model.swift
//  CardGame
//
//  Created by 이동건 on 21/08/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

// 단일 카드를 구성하는데 필요한 데이터들이 공통으로 갖추어야 할 인터페이스를 프로토콜로 묶어주었습나다.
protocol CardDataSource: CustomStringConvertible {
    static var generator: Int { get }
    var dataSource: [Int:String] { get }
}

/*

 Symbol과 Number
 카드를 구성하는데 필요한 두 가지 정보인 Symbol과 Number입니다.
 이 둘을 처음에는 구조체로 선언하였습나다. 하지만 구조체로 선언하였을 때 제가 생각한 다음의 문제점(?)들이 있었습니다.
 
 1. 랜덤 변수인 generator를 생성하는 것은 동일하지만 구조체로 구성한다면 생성자를 Failable 생성자로 바꿔주어야 했고 추가적으로 수의 범위를 검사해야 했습니다.
    👉 enum으로 한다면 추가적인 코드가 들어가지 않아도 rawValue에 해당하는 케이스가 존재하지 않는다면 nil을 반환합니다.
 2. 현재 다음 미션들을 살펴보진 않았지만 Symbol과 Number를 비교해야하는 로직이 들어간다면 구조체일 경우 이들을 비교할 때 Symbol(1)나 Number(12)는 의미전달이 불명확하다 생각했습니다.
    👉 enum으로 한다면 Symbol.spade, Number.J 처럼 보다 명확하게 구분이 가능하다 판단하였습니다.
 
*/
enum Symbol: Int, CardDataSource {
    static var generator: Int = Int(arc4random_uniform(4) + 1)
    
    var dataSource: [Int: String] {
        return [
            1 : "♣️",
            2 : "♠️",
            3 : "♥️",
            4 : "♦️"
        ]
    }
    
    var description: String {
        return dataSource[self.rawValue] ?? ""
    }
    
    case club = 1
    case spade
    case heart
    case diamond
}

enum Number: Int, CardDataSource {
    static var generator: Int = Int(arc4random_uniform(13) + 1)
    
    var dataSource: [Int: String] {
        return [
            1 : "A",
            2 : "2",
            3 : "3",
            4 : "4",
            5 : "5",
            6 : "6",
            7 : "7",
            8 : "8",
            9 : "9",
            10 : "10",
            11 : "J",
            12 : "Q",
            13 : "K"
        ]
    }
    
    var description: String {
        return dataSource[self.rawValue] ?? ""
    }
    
    case A = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case J
    case Q
    case K
}
