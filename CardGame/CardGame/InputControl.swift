import Foundation

enum InputControlError: Error {
    case notNumber
    case invalidChoice
}

class InputControl {
    
    func number(from input: String) -> Result<Int, InputControlError> {
        guard let number = Int(input) else {
            return .failure(.notNumber)
        }
        return .success(number)
    }
    
    func choice<Option>(from input: String, options: [Option]) -> Result<Option, InputControlError> {
        
        // 선택지가 숫자인지 확인합니다.
        let choice: Int
        switch number(from: input) {
        case .success(let number):
            choice = number
        case .failure(let error):
            return .failure(error)
        }
        
        // 선택지가 옵션 중에 있는지 확인합니다.
        guard (1...options.count).contains(choice) else {
            return .failure(.invalidChoice)
        }
        return .success(options[choice - 1])
    }
    
}
