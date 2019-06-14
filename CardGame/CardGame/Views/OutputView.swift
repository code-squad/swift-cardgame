import Foundation

class OutputView: TextView {
    
    func showPlayerHand(_ player: Player) {
        show("\(player.name): \(player.hand)")
    }
    
    func showAllHands(game: CardGame) {
        for player in game.players {
            showPlayerHand(player)
        }
        showPlayerHand(game.dealer)
        nextLine()
    }
    
    func showError(_ error: Error) {
        show("\(error.localizedDescription)")
    }
}
