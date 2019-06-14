import Foundation

class InputView: TextView {
    
    func showInputDescription(_ description: String) {
        show("\(description): ", terminator: "")
    }
    
    func ask(_ something: String) -> String {
        showInputDescription(something)
        return readLine() ?? ""
    }
    
    func askForNumber(_ something: String) -> Int {
        while true {
            guard let number = Int(ask(something)) else {
                    show(InputMessage.notNumber)
                    continue
            }
            return number
        }
    }
    
    /// 선택지에 번호를 붙여 텍스트로 나타냅니다.
    func show(options: [String]) {
        for index in options.indices {
            show("\(index + 1). \(options[index])")
        }
    }
    
    func askForChoice(options: [String]) -> String {
        show(options: options)
        // 제공된 선택지 중 유효한 선택지가 선택될 때 까지 반복합니다.
        while true {
            let choice = askForNumber(InputMessage.choice)
            guard (1...options.count).contains(choice) else {
                    show(InputMessage.invalidChoice)
                    continue
            }
            return options[choice - 1]
        }
    }
}
