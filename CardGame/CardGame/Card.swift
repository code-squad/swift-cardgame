//
//  Card.swift
//  CardGame
//
//  Created by Yoda Codd on 2018. 6. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 카드 객체를 만든다
class Card {
    // 숫자, 마크는 계산의 편의성을 위해서 단순인트로 선언. 이니셜라이저에서 범위로 정해진 값만 입력받게함.
    private let numbering : Int
    private let mark : Int
    
    init?(mark: Int, numbering: Int){
        guard  numbering > 0 && numbering < 14 && mark > 0 && mark < 5 else {
            return nil
        }
        self.mark = mark
        self.numbering = numbering
    }
}
