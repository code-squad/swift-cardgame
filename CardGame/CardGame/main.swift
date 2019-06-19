import Foundation

class Main {
    
    var controller = Controller()
    
    func gameRule() -> CardGame.Rule {
        while true {
            if let rule = controller.readGameRule() {
                return rule
            }
        }
    }
    
    func playerCount() -> Int {
        while true {
            if let count = controller.readPlayerCount() {
                return count
            }
        }
    }
    
    func makeGame() -> CardGame {
        while true {
            if let game = controller.generateGame(rule: gameRule(), playerCount: playerCount()) {
                return game
            }
        }
    }
    
    func startGame() {
        controller.startGame(game: makeGame())
    }
    
}

Main().startGame()
