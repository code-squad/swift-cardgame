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
    var game = CardGame(cardDeck: cardDeck)
    var result: GameResult
    repeat {
        do {
            menu = try InputView.readMenu()
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            break
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            break
        }
        do {
            result = try game.run(menu: menu)
        } catch let error as CardGame.Error {
            print(error.localizedDescription)
            break
        } catch {
            print("\(ErrorMessage.unexpectedError) : \(error)")
            break
        }
        OutputView.printGameResult(result: result)
    } while (true)
}

main()
