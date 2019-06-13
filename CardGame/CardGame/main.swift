import Foundation

var outputView = OutputView()
var inputView = InputView()

func main() {
    
    var game = CardGame()
    
    // 카드 게임의 종류를 저장합니다.
    inputView.show("카드 게임 종류를 선택하세요.")
    let ruleChoice = inputView.askForChoice(options: ["7카드", "5카드"])
    let rule: CardGame.GameRule! = CardGame.GameRule(choice: ruleChoice)
    
    // 참여 인원을 결정합니다. 인원의 범위를 초과한 경우 다시 입력 받습니다.
    var isPlayerReady = false
    while !isPlayerReady {
        inputView.show("참여할 사람의 인원을 입력하세요.")
        let players = inputView.askForNumber("사람 수")
        
        do {
            try game.addPlayers(count: players)
            isPlayerReady = true
        } catch CardGame.Error.playerLimitExceeded {
            outputView.show("플레이어 제한 초과")
        } catch {
            outputView.showUnexpectedError(error)
            return
        }
    }
    
    // 카드를 뽑고 패를 출력합니다. 카드가 다 떨어지면 게임을 종료합니다.
    var hasEnoughCards = true
    while hasEnoughCards {
        do {
            try game.giveCardsToPlayers(rule: rule)
            outputView.showAllHands(game: game)
        } catch CardGame.Error.outOfCards {
            outputView.show("카드가 다 떨어짐")
            hasEnoughCards = false
        } catch {
            outputView.showUnexpectedError(error)
            return
        }
    }
}

main()
