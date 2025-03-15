import Foundation

public class Calculator {
    private func add(firstOperand: Int, secondOperand: Int) -> Int {
        return firstOperand + secondOperand
    }
    
    private func subtract(firstOperand: Int, secondOperand: Int) -> Int {
        return firstOperand - secondOperand
    }
    
    private func divide(firstOperand: Int, secondOperand: Int) throws -> Int {
        // Division by 0 error check
        guard secondOperand != 0 else { throw DivisionError.dividedByZero }
        return firstOperand / secondOperand
    }
    
    private func multiply(firstOperand: Int, secondOperand: Int) -> Int {
        return firstOperand * secondOperand
    }
    
    private func modulus(firstOperand: Int, secondOperand: Int) throws -> Int {
        // Modulus by 0 error check
        guard secondOperand != 0 else { throw ModulusError.dividedByZero }
        return firstOperand % secondOperand
    }
    
    
    /// Process operators and execute related function
    /// - Parameters:
    ///   - op: ooperation (+, -, /, %, x)
    ///   - firstNum: x of x+y expression
    ///   - secondNum: y of x+y expression
    /// - Returns: Result
    private func processOperator(_ op: String, _ firstNum: Int, _ secondNum: Int) -> Int {
        switch op {
            case "+":
                return add(firstOperand: firstNum, secondOperand: secondNum)
            case "-":
                return subtract(firstOperand: firstNum, secondOperand: secondNum)
            case "x":
                return multiply(firstOperand: firstNum, secondOperand: secondNum)
            case "/":
                do {
                    return try divide(firstOperand: firstNum, secondOperand: secondNum)
                } catch DivisionError.dividedByZero {
                    print("Error: Division by zero.")
                    exit(1)
                } catch {
                    print(error)
                    exit(1)
                }
            case "%":
                do {
                    return try modulus(firstOperand: firstNum, secondOperand: secondNum)
                } catch ModulusError.dividedByZero {
                    print("Error: Modulus by zero.")
                    exit(1)
                } catch {
                    print(error)
                    exit(1)
                }
            default:
                print("Error: Unknown operator '\(op)'.")
                exit(1)
        }
    }
    
    
    /// Algorithum to process a calculation written in Postfix expression
    /// - Parameter postfixExpression: 1 2 + (1 + 2)
    /// - Returns: Result
    private func evaluatePostfixExpression(_ postfixExpression: [String]) -> Int {
        var stack: Stack<Int> = Stack<Int>() // Used to resursively process the operation by segment
        
        for elem in postfixExpression {
            // Condition will seperate operands from operators
            if let num: Int = Int(elem) {
                stack.push(num)
            } else {
                // Extract the two operands
                guard let firstNum: Int = stack.pop(), let secondNum: Int = stack.pop() else {
                    print("Error: Malformed expression.")
                    exit(1)
                }
                // Process the calculation and save the result back to the stack
                stack.push(processOperator(elem, secondNum, firstNum))
            }
        }
        
        guard let result = stack.pop() else {
            print("Error: Expression evaluation failed.")
            exit(1)
        }
        return result
    }
    
    /// Start of the calcualtion process
    public func calculate(_ args: [String]) -> Int {
        // Operation always should have odd numbered characters
        guard args.count % 2 != 0 else {
            print("Error: Invalid expression.")
            exit(1)
        }
        
        do {
            let postfixExpression: [String] = try PostFixExpression().infixToPostfix(args)
            return evaluatePostfixExpression(postfixExpression) // Final value
        } catch CalculatorCoreError.invalidOperator {
            print("Error: Invalid operator.")
            exit(1)
        } catch {
            print(error)
            exit(1)
        }
    }
}
