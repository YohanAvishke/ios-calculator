import Foundation

public class Calculator {
    private func add(firstOp: Int, secondOp: Int) -> Int {
        return firstOp + secondOp
    }
    
    private func subtract(firstOp: Int, secondOp: Int) -> Int {
        return firstOp - secondOp
    }
    
    private func divide(firstOp: Int, secondOp: Int) -> Int {
        if secondOp == 0 {
            print("Division by zero is not allowed")
            exit(1)
        }
        return firstOp / secondOp
    }
    
    private func multiply(firstOp: Int, secondOp: Int) -> Int {
        return firstOp * secondOp
    }
    
    private func modulus(firstOp: Int, secondOp: Int) -> Int {
        if secondOp == 0 {
            print("Modulus by zero is not allowed")
            exit(1)
        }
        return firstOp % secondOp
    }
    
    private func validateArgs(_ args: [String]) -> Bool {
        var isValid = true
        if args.count % 2 == 0 {
            isValid = false
        }
        
        return isValid
    }
    
    public func calculate(_ args: [String]) -> Int {
        if !validateArgs(args) {
            exit(1)
        }
        
        let postFixExpression = PostFixExpression()
        var stack = Stack<Int>()
        
        let postfixExpression = postFixExpression.infixToPostfix(args)
        
        for elem in postfixExpression {
            if let num = Int(elem) {
                stack.push(num)
            } else {
                let firstNum = stack.pop()!
                let secondNum = stack.pop()!
                switch elem {
                    case "+":
                        stack.push(add(firstOp: secondNum, secondOp: firstNum))
                    case "-":
                        stack.push(subtract(firstOp: secondNum, secondOp: firstNum))
                    case "x":
                        stack.push(multiply(firstOp: secondNum, secondOp: firstNum))
                    case "/":
                        stack.push(divide(firstOp: secondNum, secondOp: firstNum))
                    case "%":
                        stack.push(modulus(firstOp: secondNum, secondOp: firstNum))
                    default:
                        fatalError("Unknown operator: \(elem)")
                }
            }
        }
        
        return stack.pop()!
    }
}
