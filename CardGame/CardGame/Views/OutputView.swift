import Foundation

struct OutputView {
    
    static func show(_ text: String) {
        print(text)
    }
    
    static func nextLine() {
        print()
    }
    
    static func show(card: Card) {
        print("[\(card)]")
    }
}
