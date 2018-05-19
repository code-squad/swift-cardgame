//
//  OutputView.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

// 출력을 담당하는 객체
struct OutputView {
    
    // static을 선언 이유 : OutputView를 객체 생성하지 않고 바로 showCard함수를 실행하기 위하여 선언
    static func showCard(_ card: Card) {
        print(card.desription())
    }
}
