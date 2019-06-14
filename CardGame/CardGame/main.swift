import Foundation

var outputView = OutputView()
var inputView = InputView()
var inputControl = InputControl()

func main() {
    
    var game = CardGame()
    
    // 카드 게임의 규칙을 지정합니다.
    inputView.show(Message.gameRuleQuestion)
    inputView.showOptions(CardGame.Rule.allCases)
    let choiceInput = inputView.ask(Message.selectOption)
    let rule: CardGame.Rule
    switch inputControl.choice(from: choiceInput, options: CardGame.Rule.allCases) {
    case .failure(let error):
        outputView.show("\(error)")
        return
    case .success(let choice):
        rule = choice
    }
    
    // 참여 인원을 결정합니다. 인원의 범위를 초과한 경우 다시 입력 받습니다.
    var isPlayerReady = false
    while !isPlayerReady {
        inputView.show(Message.playerCountQuestion)
        let playerCountInput = inputView.ask(Message.playerCount)
        let playerCount: Int
        switch inputControl.number(from: playerCountInput) {
        case .failure(let error):
            outputView.show("\(error)")
            continue
        case .success(let number):
            playerCount = number
        }
        
        switch game.addPlayers(count: playerCount) {
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
