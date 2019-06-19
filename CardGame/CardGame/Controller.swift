import Foundation

class Controller {
    
    private var outputView = OutputView()
    private var inputView = InputView()
    private var inputControl = InputControl()
    
    func startGame(game: CardGame) {
        
        // 카드를 뽑고 패를 출력합니다. 카드가 다 떨어지면 게임을 종료합니다.
        var hasEnoughCards = true
        while hasEnoughCards {
            do {
                try game.giveCardsToPlayers()
                outputView.showAllHands(game: game)
                outputView.show(Message.winnerIs + game.winner.name)
                outputView.nextLine()
                
            } catch CardGameError.outOfCards {
                outputView.showError(CardGameError.outOfCards)
                hasEnoughCards = false
            } catch {
                outputView.showError(error)
                return
            }
        }
    }
    
    func generateGame(rule: CardGame.Rule, playerCount: Int) -> CardGame? {
        do {
            return try CardGame(rule: rule, playerCount: playerCount)
        } catch CardGameError.playerLimitExceeded {
            outputView.showError(CardGameError.playerLimitExceeded)
        } catch {
            outputView.showError(error)
        }
        return nil
    }
    
    
    func readGameRule() -> CardGame.Rule? {
        inputView.show(Message.gameRuleQuestion)
        inputView.showOptions(CardGame.Rule.allCases)
        let choiceInput = inputView.ask(Message.selectOption)
        switch inputControl.choice(from: choiceInput, options: CardGame.Rule.allCases) {
        case .failure(let error):
            outputView.showError(error)
            return nil
        case .success(let choice):
            return choice
        }
    }
    
    func readPlayerCount() -> Int? {
        inputView.show(Message.playerCountQuestion)
        let playerCountInput = inputView.ask(Message.playerCount)
        switch inputControl.number(from: playerCountInput) {
        case .failure(let error):
            outputView.showError(error)
            return nil
        case .success(let number):
            return number
        }
    }
    
}
