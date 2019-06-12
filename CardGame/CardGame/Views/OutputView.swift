import Foundation

class OutputView: TextView {
    
    func showPlayerHand(player: Player) {
        show("\(player.name): \(player.hand)")
    }
}
