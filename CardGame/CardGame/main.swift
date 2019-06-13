import Foundation

var outputView = OutputView()
var inputView = InputView()

func main() {
    
    var game = CardGame()
    
    // 카드 게임의 종류를 저장합니다.
    inputView.show(Message.gameRuleQuestion)
    let ruleChoice = inputView.askForChoice(options: CardGame.Rule.options)
    let rule: CardGame.Rule! = CardGame.Rule(choice: ruleChoice)
    
    // 참여 인원을 결정합니다. 인원의 범위를 초과한 경우 다시 입력 받습니다.
    var isPlayerReady = false
    while !isPlayerReady {
        inputView.show(Message.playerCountQuestion)
        let players = inputView.askForNumber(Message.playerCount)
        
        switch game.addPlayers(count: players) {
        case .success(_):
            isPlayerReady = true
        case .failure(let error):
            outputView.show(error.description)
        }
    }
    
    // 카드를 뽑고 패를 출력합니다. 카드가 다 떨어지면 게임을 종료합니다.
    var hasEnoughCards = true
    while hasEnoughCards {
        do {
            try game.giveCardsToPlayers(rule: rule)
            outputView.showAllHands(game: game)
        } catch let error as CardGameError {
            outputView.show(error.description)
            hasEnoughCards = false
        } catch {
            outputView.showUnexpectedError(error)
            return
        }
    }
}

main()
