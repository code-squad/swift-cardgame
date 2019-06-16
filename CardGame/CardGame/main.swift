import Foundation

class Main {
    var outputView = OutputView()
    var inputView = InputView()
    var inputControl = InputControl()
    
    func startGame() {
        
        var game = generateGame()
        
        // 카드를 뽑고 패를 출력합니다. 카드가 다 떨어지면 게임을 종료합니다.
        var hasEnoughCards = true
        while hasEnoughCards {
            do {
                try game.giveCardsToPlayers()
                outputView.showAllHands(game: game)
            } catch let error as CardGameError {
                outputView.showError(error)
                hasEnoughCards = false
            } catch {
                outputView.showError(error)
                return
            }
        }
    }
    
    func readGameRule() -> CardGame.Rule {
        while true {
            inputView.show(Message.gameRuleQuestion)
            inputView.showOptions(CardGame.Rule.allCases)
            let choiceInput = inputView.ask(Message.selectOption)
            switch inputControl.choice(from: choiceInput, options: CardGame.Rule.allCases) {
            case .failure(let error):
                outputView.showError(error)
                continue
            case .success(let choice):
                return choice
            }
        }
    }
    
    func readPlayerCount() -> Int {
        while true {
            inputView.show(Message.playerCountQuestion)
            let playerCountInput = inputView.ask(Message.playerCount)
            switch inputControl.number(from: playerCountInput) {
            case .failure(let error):
                outputView.showError(error)
                continue
            case .success(let number):
                return number
            }
        }
    }
    
    func generateGame() -> CardGame {
        while true {
            let rule = readGameRule()
            let playerCount = readPlayerCount()
            do {
                return try CardGame(rule: rule, playerCount: playerCount)
            } catch let error as CardGameError {
                outputView.showError(error)
            } catch {
                outputView.showError(error)
            }
        }
    }
    
}

print(PokerHand.fourOfAKind(.ace) < .fourOfAKind(.eight))

Main().startGame()
