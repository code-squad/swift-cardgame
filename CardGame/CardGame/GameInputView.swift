//
//  GameInputView.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 7..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct GameInputView {
    func playtheGame() throws -> CardGameInfo {
        return CardGameInfo(typeOfGames: try selectTypesOfGames(), withPlayers: try registerPlayers())
    }
    
    private func selectTypesOfGames() throws -> CardGameInfo.Games {
        print("카드게임의 종류를 선택하세요.")
        print("1. 7카드")
        print("2. 5카드")
        guard let selectedNumber = readLine(),
            let number = Int(selectedNumber) else {
            throw ErrorCode.invaildInput
        }
        switch number {
        case 1:
            return CardGameInfo.Games.sevenPoker
        case 2:
            return CardGameInfo.Games.fivePoker
        default:
            throw ErrorCode.noGameNumbers
        }
    }
    
    private func registerPlayers() throws -> Int {
        print("참여할 인원을 입력하세요.")
        guard let playersNumber = readLine(),
            let players = Int(playersNumber) else {
                throw ErrorCode.invaildInput
        }
        if players < 0 && players > 5 {
            throw ErrorCode.invaildPlayersNumber
        }
        return players
    }
}
