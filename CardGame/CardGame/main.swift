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
            OutputView.printGameResult(result: GameResult.initialize(cardDeck.count()))
            break
        case .shuffle:
            cardDeck.shuffle()
            OutputView.printGameResult(result: GameResult.shuffle(cardDeck.count()))
            break
        case .draw:
            guard let card = cardDeck.removeOne() else {
                return
            }
            OutputView.printGameResult(result: GameResult.draw(card, cardDeck.count()))
            break
        }
    } while (true)
}

main()
