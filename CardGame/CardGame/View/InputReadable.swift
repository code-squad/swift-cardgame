//
//  UserInput.swift
//  CardGame
//
//  Created by temphee.Reid on 01/10/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


protocol InputReadable {
    func read(message: Menu) -> String
}

enum Menu : CustomStringConvertible{
    case cardDeckTest
    case kindOfGame
    case numberOfPlayer
    
    var description : String {
        var menu : String
        switch self {
        case .cardDeckTest :
            menu =  """
            다음 메뉴를 선택해 주세요
            1. 카드 초기화
            2. 카드 섞기
            3. 카드 하나 뽑기
            """
            
        case .kindOfGame :
            menu =  """
                    카드 게임 종류를 선택하세요.
                    1. 7카드
                    2. 5카드
                    """
            
        case .numberOfPlayer :
            menu =  "참여할 사람의 인원을 입력하세요."
            
        default :
            menu = ""
        }
        
        return menu
    }
}
