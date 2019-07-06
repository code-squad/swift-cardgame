//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let cardDeck = CardDeck()
    var menu: GameMenu
    var game = CardGame(deck: cardDeck)
    var result: CardGameResult
    repeat {
        do {
            menu = try InputView.readMenu()
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            break
        } catch {
            print("\(ErrorMessage.invalidMenu) : \(error)")
            break
        }
        do {
            result = try game.play(menu: menu)
        } catch let error as CardGame.Error {
            print(error.localizedDescription)
            break
        } catch {
            print("\(ErrorMessage.invalidMenu) : \(error)")
            break
        }
        OutputView.printResult(result: result)
    } while (true)
}

main()
