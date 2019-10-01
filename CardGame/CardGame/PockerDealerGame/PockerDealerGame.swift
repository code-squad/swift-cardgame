//
/******************************************************************************
 * File Name        : PockerDealerGame.swift
 * Description      : CardGame
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation

class PockerDealerGame {
    
    private let cardDeck = CardDeck()
    
    private let inputView: PockerDealerInputView
    private let outputView: PockerDealerOutputView
    
    private var gameType: PockerDealerMenu = .unknown
    private var competitors: [PockerPlayer]  = []
    private var isPrepared = false
    
    public init(viewForInput: PockerDealerInputView, viewForOutput: PockerDealerOutputView) {
        self.inputView = viewForInput
        self.outputView = viewForOutput
    }
    
    public func prepareGame() {
        inputView.printMenu()
        guard let inputedMenu = inputView.readMenu() else {
            outputView.printError()
            return
        }
        self.gameType = inputedMenu
        
        inputView.printPlayerRequirement()
        guard let inputedNum = inputView.readNumOfPlayer() else {
            outputView.printError()
            return
        }
        
        self.createCompetitors(numOfPlayer: inputedNum)
        
        cardDeck.reset()
        cardDeck.shuffle()
        
        isPrepared = true
    }
    
    private func createCompetitors(numOfPlayer: Int) {
        for i in 1...numOfPlayer {
            let player = PockerPlayer(role: .player, backNumber: i)
            self.competitors.append(player)
        }
        let dealer = PockerPlayer(role: .dealer, backNumber: 0)
        self.competitors.append(dealer)
    }
    
    public func playGame() {
        if isPrepared == false {
            self.prepareGame()
        }
        
        while self.canContinue(type: self.gameType,
                               playerNum: self.competitors.count,
                               remainCardNum: self.cardDeck.count())
        {
            self.playOneTurn()
            self.competitors.map{ $0.clearCardInHand() }
        }
    }
    
    private func canContinue(type: PockerDealerMenu, playerNum: Int, remainCardNum: Int) -> Bool {
        let cardNumForOneTurn = type.numberOfCardForOneTurn * playerNum+1 //+1 is dealer
        
        return remainCardNum >= cardNumForOneTurn
    }
    
    private func playOneTurn() {
        //카드 나눠줌
        for _ in 1...gameType.numberOfCardForOneTurn {
            for competitor in competitors {
                if let pickOneCard = cardDeck.removeOne() {
                    competitor.receiveCard(pickOneCard)
                } else {
                    break;
                }
            }
        }
        
        //output 출력
        for competitor in competitors {
            outputView.printResult(competitor)
        }
        outputView.printText()
    }
    
    
}
