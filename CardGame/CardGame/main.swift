
//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run(){
   
    // make card deck
    let cardDeck = CardDeck()    

// 주석을 사용하여 입력기능을 잠시 사용하지 않음.
/********** input menu (step 1, 2, 3) **********/
    
/*
    var isPlay = true

    repeat {
        // inputview
        let inputView = InputView()
        let numberOfMenu = inputView.printMenu()
        if numberOfMenu == 4 {
            isPlay = false
        }

        // outputview
        let outputView = OutputView(cardDeck: cardDeck)
        outputView.printResult(numberOfMenu: numberOfMenu)
    } while isPlay

    /************ card stack ************/
    
    let outputView = OutputView(cardDeck: cardDeck)
    outputView.printCardStack()
 
*/
    
/************ Game input menu (step 4) ************/
    
    let gameInputView = GameInputView()
    var isPrintMenu = true
    var isGameOn = true
    var gameInfo: GameInfo?
    // inputview
    repeat {
        do {
            gameInfo = try gameInputView.inputKindOfCardGame()
            isPrintMenu = false
        }catch GameInputView.CardGameError.InvalidCardGameSelection {
            print("게임 선택 번호 오류")
        }catch GameInputView.CardGameError.InvalidNumberOfPlayer {
            print("게임플레이어 인원 입력 오류")
        }catch {
            print("그 외의 오류")
        }
    } while isPrintMenu
    
    // outputview
    let outputView = OutputView(cardDeck: cardDeck, gameInfo: gameInfo!)
    repeat {
        isGameOn = outputView.printPokerDealer()
        print()
    } while isGameOn
}
run()
