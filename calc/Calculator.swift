import Foundation

public class Calculator {
    private func add(firstOp: Int, secondOp: Int) -> Int {
        return firstOp + secondOp
    }
    
    private func subtract(firstOp: Int, secondOp: Int) -> Int {
        return firstOp - secondOp
    }
    
    private func divide(firstOp: Int, secondOp: Int) throws -> Int {
        if secondOp == 0 {
            throw DivisonError.dividedByZero
        }
        return firstOp / secondOp
    }
    
    private func multiply(firstOp: Int, secondOp: Int) -> Int {
        return firstOp * secondOp
    }
    
    private func modulus(firstOp: Int, secondOp: Int) throws -> Int {
        if secondOp == 0 {
            throw ModulusError.dividedByZero
        }
        return firstOp % secondOp
    }
    
    private func validateArgs(_ args: [String]) throws {
        if args.count % 2 == 0 {
            throw CalculatorCoreError.invalidNumberofArguments
        }
    }
    
    public func calculate(_ args: [String]) -> Int {
        do {
            try validateArgs(args)
        } catch {
            print("Error: Invalid number of arguments.")
            exit(1)
        }
        
        let postfixExpression: [String] = PostFixExpression().infixToPostfix(args)
        var stack: Stack<Int> = Stack<Int>()
        
        
        for elem in postfixExpression {
            if let num: Int = Int(elem) {
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
                        do {
                            try stack.push(divide(firstOp: secondNum, secondOp: firstNum))
                        } catch DivisonError.dividedByZero {
                            print("Error: Denominator cannot be 0 for divisiion operation.")
                            exit(1)
                        } catch {
                            print(error)
                            exit(1)
                        }
                    case "%":
                        do {
                            try stack.push(modulus(firstOp: secondNum, secondOp: firstNum))
                        } catch ModulusError.dividedByZero {
                            print("Error: Denominator cannot be 0 for modulus operation.")
                            exit(1)
                        } catch {
                            print(error)
                            exit(1)
                        }
                    default:
                        fatalError("Unknown operator: \(elem)")
                }
            }
        }
        return stack.pop()!
    }
}
