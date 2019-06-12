import Foundation

class OutputView: TextView {
    
    func showPlayerHand(_ player: Player) {
        show("\(player.name): \(player.hand)")
    }
    
    func showAllHands(game: CardGame) {
        for player in game.players {
            outputView.showPlayerHand(player)
        }
        outputView.showPlayerHand(game.dealer)
        nextLine()
    }
    
    func showUnexpectedError(_ error: Error) {
        show("예상치 못한 오류: \(error)")
    }
}
