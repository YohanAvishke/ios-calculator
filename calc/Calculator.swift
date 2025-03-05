import Foundation

class Calculator {
    var currentResult:String?
    
    func add(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
    func subtract(firstNum: Int, secondNum: Int) -> Int {
        return firstNum - secondNum
    }
    
    func divide(firstNum: Int, secondNum: Int) -> Int {
        // secondNum cannot be 0
        return firstNum / secondNum
    }
    
    func multiply(firstNum: Int, secondNum: Int) -> Int {
        return firstNum * secondNum
    }
    
    func modulus(firstNum: Int, secondNum: Int) -> Int {
        return firstNum % secondNum
    }
    
    func calculate(args: [String]) -> String {
        var args = ["1","+","1"]
        if args.count % 2 == 0 {
            return "Invalid Calucation Expression!"
        }
        
        var result:String = "Invalid Character provided!"
        
        for i in stride(from: 1, to: args.count-1, by: 2) {
            let curentOpChar = args[i]
            let nextOpChar = args[i+2]
            
        }
        
        for i in stride(from: 0, to: args.count, by: 3) {
            let firstNum = Int(args[i])!
            let operatorChar = args[i+1]
            let secondNum = Int(args[i+2])!
            
            switch  operatorChar {
            case "+":
                result = add(firstNum: firstNum, secondNum: secondNum)
            case "-":
                result = subtract(firstNum: firstNum, secondNum: secondNum)
            default:
                break
            }
        }
        
        return result
    }
}
