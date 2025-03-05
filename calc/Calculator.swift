import Foundation

class Calculator {
    var currentResult:String?
    
    func add(firstInput: Int, secondInput: Int) -> Int {
        return firstInput + secondInput
    }
    
    func calculate(args: [String]) -> String {
        return String(add(firstInput: Int(args[0])!, secondInput: Int(args[2])!))
    }
}
