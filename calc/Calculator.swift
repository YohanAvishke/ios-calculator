import Foundation

class Calculator {
    var currentResult:String?
    
    func add(firstNum: Int, secondNum: Int) -> String {
        return String(firstNum + secondNum)
    }
    func subtract(firstNum: Int, secondNum: Int) -> String {
        return String(firstNum - secondNum)
    }
    
    func calculate(args: [String]) -> String {
        if args.count % 2 == 0 {
            return "Invalid Calucation Expression!"
        }
        
        var result:String = "Invalid Character provided!"
        let firstNum = Int(args[0])!
        let secondNum = Int(args[2])!
        
        switch  args[1] {
        case "+":
            result = add(firstNum: firstNum, secondNum: secondNum)
        case "-":
            result = subtract(firstNum: firstNum, secondNum: secondNum)
        default:
            break
        }
        return result
    }
}
