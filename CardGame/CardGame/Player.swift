import Foundation

struct Player {
    var name: String
    var hand = [Card]()
    init(name: String) {
        self.name = name
    }
}

