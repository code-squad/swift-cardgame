//
//  OutputView.swift
//  CardGameUnitTest
//
//  Created by Jung seoung Yeo on 2018. 5. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 출력을 담당하는 객체
struct OutputView {
    
    // 시작 시 실행 선택하는 메시지
    static func askCardGameType() {
        print(CARDGAME.ASK.Rule)
    }
    
    static func askPalyerCount() {
        print(CARDGAME.ASK.NumberOfPlayer)
    }
    
    // 에러 메시지를 출력 하는 함수
    static func errorMessage(_ e : CARDGAME.ERROR) {
        print(e)
    }
    
    // 자신의 패를 보여주는 함수
    static func showPlayerCard(_ players: [Playerable]) {
        for player in players {
            player.showPlayer{
                print($0.showMyCard())
            }
        }
        print()
    }
}
