import Foundation

public class Calculator {
    private func add(firstOp: Int, secondOp: Int) -> Int {
        return firstOp + secondOp
    }
    
    private func subtract(firstOp: Int, secondOp: Int) -> Int {
        return firstOp - secondOp
    }
    
    private func divide(firstOp: Int, secondOp: Int) -> Int {
        return firstOp / secondOp
    }
    
    private func multiply(firstOp: Int, secondOp: Int) -> Int {
        return firstOp * secondOp
    }
    
    private func modulus(firstOp: Int, secondOp: Int) -> Int {
        return firstOp % secondOp
    }
    
    public func calculate(_ args: [String]) -> Int {
        var formulae = args.joined()
        let postFixExpression = PostFixExpression()
        var stack = Stack<Int>()
        
        formulae = postFixExpression.infixToPostfix(formulae)
        
        for char in formulae {
            if let num = char.wholeNumberValue {
                stack.push(num)
            } else {
                let firstNum = stack.pop()!
                let secondNum = stack.pop()!
                switch char {
                    case "+":
                        stack.push(add(firstOp: secondNum, secondOp: firstNum))
                    case "-":
                        stack.push(subtract(firstOp: secondNum, secondOp: firstNum))
                    case "x":
                        stack.push(multiply(firstOp: secondNum, secondOp: firstNum))
                    case "/":
                        stack.push(divide(firstOp: secondNum, secondOp: firstNum))
                    default:
                        fatalError("Unknown operator: \(char)")
                }
            }
        }
        
        return stack.pop()!
    }
}
