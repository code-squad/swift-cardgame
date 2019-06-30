//
//  main.swift
//  CardGame
//
//  Created by JK on 10/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var cardDeck = CardDeck()
    var menu: GameMenu
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
        switch menu {
        case .initialize:
            cardDeck.reset()
            result = GameResult.initialize(cardDeck.count())
        case .shuffle:
            cardDeck.shuffle()
            result = GameResult.shuffle(cardDeck.count())
        case .draw:
            guard let card = cardDeck.removeOne() else {
                return
            }
            result = GameResult.draw(card, cardDeck.count())
        }
        OutputView.printGameResult(result: result)
    } while (true)
}

main()
